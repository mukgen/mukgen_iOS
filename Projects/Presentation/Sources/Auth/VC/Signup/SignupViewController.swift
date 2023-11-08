import UIKit
import INetwork
import SnapKit
import Then
import RxCocoa
import RxSwift
import Core
import INFOKit

enum MyError: Error {
    case missingFields
    case invalidEmail
    case weakPassword
    case checkCode

    var localizedDescription: String {
        switch self {
        case .missingFields:
            return "필수 항목이 누락되었습니다. 모든 필수 항목을 입력해주세요."
        case .invalidEmail:
            return "유효하지 않은 이메일 주소입니다. 유효한 이메일 주소를 입력해주세요."
        case .weakPassword:
            return "약한 비밀번호입니다. 보다 강력한 비밀번호를 선택해주세요."
        case .checkCode:
            return "유효하지 않은 인증번호입니다. 유효한 인증번호를 입력해주세요."
        }
    }
}


public class SignupViewController: UIViewController {

    private let disposeBag = DisposeBag()

    public var factory: ModuleFactoryInterface!

    public var viewModel: SignupViewModel!

    private lazy var purpleLogo = UIImageView().then {
        $0.image = INFOKitAsset.Assets.purpleLogo.image
    }

    private lazy var studentLoginTitle = UILabel().then {
        $0.text = "학생 회원가입"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 36.0, weight: .bold)
    }

    private lazy var gmailFieldView = InfoTwoFieldView(title: "이메일", placeholder1: "이메일을 입력해주세요.", placeholder2: "인증번호를 입력해주세요.", buttonVisible: true)
    private lazy var studentIdFieldView1 = InfoTwoFieldView(title: "이름 · 학번", placeholder1: "이름을 입력해주세요.", placeholder2: "학번을 입력해주세요.")
    private lazy var studentIdFieldView2 = InfoTwoFieldView(title: "이름 · 학번", placeholder1: "비밀번호를 입력해주세요.", placeholder2: "비밀번호를 다시 입력해주세요.")
    private lazy var githubFieldView = InfoOneFieldView(title: "깃허브 주소", placeholder: "깃허브 주소를 입력해주세요.")
    private lazy var signupButton = InfoCustomButton(title: "회원가입", backgroundColor: INFOKitAsset.Colors.mainColor.color, titleColor: .white)

    private lazy var userInfoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4.0
        $0.addArrangedSubview(InfoLabel(title: "info 기존 회원이신가요?"))
        $0.addArrangedSubview(InfoButton(buttonTitle: "로그인", underlineEnabled: false, titleColor: INFOKitAsset.Colors.mainColor.color))
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        layout()

        let authService = AuthService()

        //Observable 이라서 생기는 문제 나중에 리펙 ㄱ ✌️
        viewModel = SignupViewModel(authService: authService,
                                    gmailText: gmailFieldView.textField1.rx.controlEvent(.editingDidEndOnExit).map { [weak self] in self?.gmailFieldView.textField1.text },
                                    emailCodeText: gmailFieldView.textField2.rx.controlEvent(.editingDidEndOnExit).map { [weak self] in self?.gmailFieldView.textField2.text },
                                    studentKeyText: studentIdFieldView1.textField1.rx.controlEvent(.editingDidEndOnExit).map { [weak self] in self?.studentIdFieldView1.textField1.text },
                                    nameText: studentIdFieldView1.textField2.rx.controlEvent(.editingDidEndOnExit).map { [weak self] in self?.studentIdFieldView1.textField2.text },
                                    passwordText: studentIdFieldView2.textField1.rx.controlEvent(.editingDidEndOnExit).map { [weak self] in self?.studentIdFieldView2.textField1.text },
                                    githubLinkText: githubFieldView.textField.rx.controlEvent(.editingDidEndOnExit).map { [weak self] in self?.githubFieldView.textField.text })

        signupButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                print("클릭")

                self.viewModel.signUp(gmail: self.gmailFieldView.textField1.text,
                                      emailCode: self.gmailFieldView.textField2.text,
                                      studentKey: self.studentIdFieldView1.textField2.text,
                                      name: self.studentIdFieldView1.textField1.text,
                                      password: self.studentIdFieldView2.textField1.text,
                                      githubLink: self.githubFieldView.textField.text!)
            })
            .disposed(by: disposeBag)

        viewModel.signupResult
            .subscribe(onNext: { [weak self] result in
                switch result {
                case .success:
                    print("회원가입 성공")
                case .failure(let error):
                    print("회원가입 실패: \(error.localizedDescription)")
                }
            })
            .disposed(by: disposeBag)

        gmailFieldView.button1.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                guard let email = self?.gmailFieldView.textField1.text else { return }
                self?.viewModel.sendCode(email: email)
            })
            .disposed(by: disposeBag)

        gmailFieldView.button2.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                guard let email = self?.gmailFieldView.textField1.text else { return }
                guard let code = self?.gmailFieldView.textField2.text else { return }
                self?.viewModel.checkCode(email: email, data: code, type: "SIGNUP_EMAIL")
            })
    }

    func layout() {
        view.addSubviews([
            purpleLogo,
            studentLoginTitle,
            gmailFieldView,
            studentIdFieldView1,
            studentIdFieldView2,
            githubFieldView,
            signupButton,
            userInfoStackView
        ])

        purpleLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50.0)
            $0.left.equalToSuperview().offset(50.0)
            $0.width.equalTo(58.0)
            $0.height.equalTo(20.0)
        }

        studentLoginTitle.snp.makeConstraints {
            $0.top.equalTo(purpleLogo.snp.bottom).offset(10.0)
            $0.left.equalTo(purpleLogo.snp.left)
        }

        gmailFieldView.snp.makeConstraints {
            $0.top.equalTo(studentLoginTitle.snp.bottom).offset(14.0)
            $0.leading.trailing.equalToSuperview().inset(50.0)
            $0.height.equalTo(119.0)
        }

        studentIdFieldView1.snp.makeConstraints {
            $0.top.equalTo(gmailFieldView.snp.bottom).offset(30.0)
            $0.leading.trailing.equalToSuperview().inset(50.0)
            $0.height.equalTo(119.0)
        }

        studentIdFieldView2.snp.makeConstraints {
            $0.top.equalTo(studentIdFieldView1.snp.bottom).offset(30.0)
            $0.leading.trailing.equalToSuperview().inset(50.0)
            $0.height.equalTo(119.0)
        }

        githubFieldView.snp.makeConstraints {
            $0.top.equalTo(studentIdFieldView2.snp.bottom).offset(30.0)
            $0.leading.trailing.equalToSuperview().inset(50.0)
            $0.height.equalTo(69.0)
        }

        signupButton.snp.makeConstraints {
            $0.top.equalTo(githubFieldView.snp.bottom).offset(40.0)
            $0.leading.trailing.equalToSuperview().inset(50.0)
            $0.height.equalTo(40.0)
        }

        userInfoStackView.snp.makeConstraints {
            $0.top.equalTo(signupButton.snp.bottom).offset(14.0)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(80.0)
        }
    }
}
