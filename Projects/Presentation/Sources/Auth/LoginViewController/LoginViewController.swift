import UIKit
import SnapKit
import Then
import Core
import MukgenKit
import AuthService

public class LoginViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    let authService = AuthService()
    
    private let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: MukgenKitAsset.Colors.primaryLight2.color,
        .font: UIFont.systemFont(ofSize: 20, weight: .semibold)
    ]
        
    private lazy var inputIdPasswordLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "로그인을 위한\n정보를 입력해주세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private lazy var showPWButton = UIButton().then {
        $0.setImage(MukgenKitAsset.Assets.eye.image, for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(hidePWField), for: [.touchUpInside, .touchDragExit])
        $0.addTarget(self, action: #selector(showPWField), for: [.touchDown, .touchDragEnter])
    }
    
    public lazy var textFields: [CustomTextField] = {
        let textField1 = CustomTextField()
        textField1.placeholder = "아이디"
        let textField2 = CustomTextField()
        textField2.isSecureTextEntry = true
        textField2.placeholder = "비밀번호"
        return [textField1, textField2]
    }()
    
    private lazy var lines: [UIView] = {
        let line1 = createLineView()
        let line2 = createLineView()
        return [line1, line2]
    }()
    
    private lazy var nextPageButton = CustomButton(
        title: "다음",
        backgroundColor: MukgenKitAsset.Colors.primaryLight2.color,
        titleColor: .white,
        font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
        $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    }
    
    private let darkeningView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.12)
    }
    
    public override func layout() {
        textFields.forEach { view.addSubview($0) }
        lines.forEach { view.addSubview($0) }
        [
            inputIdPasswordLabel,
            showPWButton,
            nextPageButton
        ].forEach { view.addSubview($0) }
        
        inputIdPasswordLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(123)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        showPWButton.snp.makeConstraints {
            $0.centerY.equalTo(textFields[1])
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(24)
        }
        
        for i in 0..<textFields.count {
            textFields[i].snp.makeConstraints() {
                if i == 0 {
                    $0.top.equalTo(inputIdPasswordLabel.snp.bottom).offset(24)
                } else {
                    $0.top.equalTo(textFields[i - 1].snp.bottom).offset(24)
                }
                $0.left.equalToSuperview().offset(20)
                $0.width.equalToSuperview()
                $0.height.equalTo(56)
            }
            
            lines[i].snp.makeConstraints() {
                $0.top.equalTo(textFields[i].snp.bottom).offset(0)
                $0.left.equalToSuperview().offset(20)
                $0.right.equalToSuperview().inset(20)
                $0.height.equalTo(2)
            }
        }
        
        nextPageButton.snp.makeConstraints() {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(55)
        }
    }
    
    public override func attribute() {
        super.attribute()
        view.backgroundColor = .white
        
        textFields.enumerated().forEach { index, textField in
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "",
                                                                 attributes: attributes)
            textField.delegate = self
            textField.tag = index + 1
            textField.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
        }
        setupKeyboardObservers()
    }
    
    private func removeDarkeningView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.darkeningView.alpha = 0
        }, completion: { _ in
            self.darkeningView.removeFromSuperview()
        })
    }
    
    @objc private func showPWField() {
        textFields[1].isSecureTextEntry = false
        showPWButton.setImage(MukgenKitAsset.Assets.colorEye.image, for: .normal)
    }
    
    @objc private func hidePWField() {
        textFields[1].isSecureTextEntry = true
        showPWButton.setImage(MukgenKitAsset.Assets.eye.image, for: .normal)
    }
    
    private func createTextField(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.tintColor = .black
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.placeholder = placeholder
        return textField
    }
    
    private func createLineView() -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
        return lineView
    }
    
    private func updateButtonColor() {
        let isEmpty = textFields.allSatisfy { !$0.text!.isEmpty }
        DispatchQueue.main.async {
            self.nextPageButton.backgroundColor = isEmpty ? MukgenKitAsset.Colors.primaryBase.color : MukgenKitAsset.Colors.primaryLight2.color
        }
    }
    
    @objc private func textFieldContentDidChange(_ textField: UITextField) {
        updateButtonColor()
        
    }
    
    @objc private func nextPageButtonDidTap() {
        guard let accountId = textFields[0].text, let password = textFields[1].text else {
            print("Please enter Account ID and Password.")
            return
        }
//
//        authService.login(accountId: accountId, password: password) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let loginResponse):
//                    self?.textFields[1].isCorrectIdPW()
//
//                    self?.darkeningView.frame = self?.view.bounds ?? .zero
//                    self?.darkeningView.alpha = 0
//                    self?.view.addSubview(self?.darkeningView ?? UIView())
//
//                    UIView.animate(withDuration: 0.3) {
//                        self?.darkeningView.alpha = 1
//                    }
//
//                    let customAlert = CustomAlertView(
//                        labelText: "\(accountId) 님\n환영합니다!",
//                        buttonLabelText: "확인",
//                        buttonAction: { [weak self] in
//                            print("알림 버튼이 눌렸습니다.")
//                            self?.removeDarkeningView()
//                        }
//                    )
//                    self?.view.addSubview(customAlert)
//                    customAlert.snp.makeConstraints {
//                        $0.center.equalToSuperview()
//                    }
//                    print("Login successful. Welcome, \(loginResponse.message)!")
//                    print("accessToken: \(loginResponse.tokenResponse.accessToken)")
//                    print("refreshToken: \(loginResponse.tokenResponse.refreshToken)")
//
//                    self?.authService.setRefreshToken(token: loginResponse.tokenResponse.refreshToken)
//
//                case .failure(let error):
//                    self?.textFields[1].isIncorrectIdPW()
//                    print("Login failed. Error: \(error.localizedDescription)")
//                }
//            }
//        }
        //            self.navigationController?.pushViewController(TapBarV(), animated: true)
    }
    
    @objc func giveMeSaveToken() {
        print("----------------------")
//        print("--------\(self.authService.getToken())--------")
        print("----------------------")
    }
    
    private func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        lines.forEach { $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color }
    }
    
    deinit {
        removeKeyboardObservers()
    }
}

extension LoginViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case textFields[0]:
            animate(line: lines[0])
            lines[0].backgroundColor = MukgenKitAsset.Colors.pointBase.color
        case textFields[1]:
            animate(line: lines[1])
            lines[1].backgroundColor = MukgenKitAsset.Colors.pointBase.color
        default:
            return
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let index = textFields.firstIndex(of: textField as! CustomTextField) {
            if index < textFields.count - 1 {
                textFields[index + 1].becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
        return true
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            
            UIView.animate(withDuration: 0.3) {
                self.nextPageButton.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight + 10)
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.nextPageButton.transform = .identity
        }
    }
}

extension CustomTextField {
    public func isIncorrectIdPW() -> Bool {
        setMessage("아이디나 비밀번호가 맞지 않습니다.", color: .systemRed)
        return false
    }
    
    public func isCorrectIdPW() -> Bool {
        setMessage(nil)
        return true
    }
}
