import UIKit
import SnapKit
import Then
import Core
import MukgenKit
import RxSwift
import RxCocoa

public class LoginView: BaseVC {
    public var factory: ModuleFactoryInterface!
    
    let disposeBag = DisposeBag()
    
    private lazy var inputIdPasswordUILabel = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "로그인을 위한\n정보를 입력해주세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    public lazy var textFields: [CustomTextField] = {
        let textField1 = CustomTextField()
        textField1.placeholder = "아이디"
        let textField2 = CustomTextField()
        textField2.isSecureTextEntry = true
        textField2.placeholder = "비밀번호"
        return [textField1, textField2]
        
        textFields[0].rx.text.orEmpty
            .subscribe(onNext: { text in
                print("You've typed in ID field: \(text)")
            })
            .disposed(by: disposeBag)

        textFields[1].rx.text.orEmpty
            .subscribe(onNext: { text in
                print("You've typed in Password field: \(text)")
            })
            .disposed(by: disposeBag)
    }()
    
    private lazy var lines: [UIView] = {
        let line1 = createLineView()
        let line2 = createLineView()
        return [line1, line2]
    }()
    
    
    private lazy var nextPageButton = CustomButton(
        title: "다음",
        backgroundColor: .red,
        titleColor: .white,
        font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
        $0.rx.tap
            .subscribe(onNext: {
                self.nextPageButtonDidTap()
            }).disposed(by: disposeBag)
    }
    
    public override func layout() {
        [
            inputIdPasswordUILabel,
            nextPageButton,
        ].forEach( {view.addSubview($0)} )
        
        inputIdPasswordUILabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(123)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        inputIdPasswordUILabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        nextPageButton.snp.makeConstraints() {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(55)
        }
    }
    
    private func createLineView() -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
        return lineView
    }


    
    private func nextPageButtonDidTap() {
        guard let accountId = textFields[0].text, let password = textFields[1].text else {
            print("Please enter Account ID and Password.")
            return
        }
    }
    
    private func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
}
