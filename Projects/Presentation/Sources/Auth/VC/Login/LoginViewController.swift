import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import Core
import INFOKit
import INetwork

public class LoginViewController: UIViewController {
    
    private var viewModel: LoginViewModel!
    
    private let disposeBag = DisposeBag()
    
    public var factory: ModuleFactoryInterface!
    
    private lazy var whiteLogo = UIImageView().then {
        $0.image = INFOKitAsset.Assets.whiteLogo.image
    }

    private lazy var purpleLogo = UIImageView().then {
        $0.image = INFOKitAsset.Assets.purpleLogo.image
    }
    
    private lazy var loginBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 30.0
    }
    
    private lazy var studentLoginTitle = UILabel().then {
        $0.text = "학생 로그인"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 36.0, weight: .bold)
    }
    
    private lazy var emailFieldView = InfoOneFieldView(title: "이메일")
    private lazy var passwordFieldView = InfoOneFieldView(title: "비밀번호")
    private lazy var loginButton = InfoCustomButton(title: "로그인", backgroundColor: INFOKitAsset.Colors.mainColor.color, titleColor: .white)
    
    private lazy var findPasswordStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4.0
        $0.addArrangedSubview(InfoLabel(title: "비밀번호를 잊으셨나요?"))
        $0.addArrangedSubview(InfoButton(buttonTitle: "비밀번호 찾기", underlineEnabled: false, titleColor: INFOKitAsset.Colors.mainColor.color))
    }
    
    private lazy var firstInfoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4.0
        $0.addArrangedSubview(InfoLabel(title: "info가 처음이신가요?"))
        $0.addArrangedSubview(InfoButton(buttonTitle: "회원가입", underlineEnabled: false, titleColor: INFOKitAsset.Colors.mainColor.color))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print("LoginViewController")
        view.backgroundColor = INFOKitAsset.Colors.mainColor.color
        layout()
        
        emailFieldView.textField.delegate = self
        passwordFieldView.textField.delegate = self
        
        let authService = AuthService()
        
        viewModel = LoginViewModel(authService: authService)
        
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.login()
            })
            .disposed(by: disposeBag)
    }
    
    private func login() {
        let email = emailFieldView.textField.text ?? ""
        let password = passwordFieldView.textField.text ?? ""
        
        viewModel.login(email: email, password: password)
    }
    
    func layout() {
        view.addSubviews([
            whiteLogo,
            loginBackgroundView,
            purpleLogo,
            studentLoginTitle,
            emailFieldView,
            passwordFieldView,
            loginButton,
            findPasswordStackView,
            firstInfoStackView
        ])
        
        whiteLogo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(173.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(116.0)
            $0.height.equalTo(37.0)
        }
        
        loginBackgroundView.snp.makeConstraints {
            $0.top.equalTo(whiteLogo.snp.bottom).offset(107)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        purpleLogo.snp.makeConstraints {
            $0.top.equalTo(loginBackgroundView.snp.top).offset(60.0)
            $0.left.equalToSuperview().offset(50.0)
            $0.width.equalTo(58.0)
            $0.height.equalTo(20.0)
        }

        studentLoginTitle.snp.makeConstraints {
            $0.top.equalTo(purpleLogo.snp.bottom).offset(10.0)
            $0.left.equalTo(purpleLogo.snp.left)
        }
        
        emailFieldView.snp.makeConstraints {
            $0.top.equalTo(studentLoginTitle.snp.bottom).offset(64.0)
            $0.leading.trailing.equalToSuperview().inset(50.0)
            $0.height.equalTo(80.0)
        }
        
        passwordFieldView.snp.makeConstraints {
            $0.top.equalTo(emailFieldView.snp.bottom).offset(20.0)
            $0.leading.trailing.equalTo(emailFieldView)
            $0.height.equalTo(emailFieldView)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordFieldView.snp.bottom).offset(70.0)
            $0.leading.trailing.equalToSuperview().inset(50.0)
            $0.height.equalTo(48.0)
        }
        
        findPasswordStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(14.0)
            $0.centerX.equalToSuperview()
        }

        firstInfoStackView.snp.makeConstraints {
            $0.top.equalTo(findPasswordStackView.snp.bottom).offset(10.0)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(80.0)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("필드 클릭")
        return true
    }
}
