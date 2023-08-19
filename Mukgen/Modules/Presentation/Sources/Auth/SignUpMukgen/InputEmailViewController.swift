import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class InputEmailViewController: BaseVC {
    public var factory: ModuleFactoryInterface!
    
    private let attributes = [NSAttributedString.Key.foregroundColor: MukgenKitAsset.Colors.primaryLight2.color,
                          .font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
    
    private let progressEmailLabel = UILabel().then {
        $0.text = "이메일 인증을 진행해주세요."
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let guideInputEmail = UILabel().then {
        $0.text = "입력한 이메일로 인증번호가 전송됩니다."
        $0.backgroundColor = .clear
        $0.textColor = MukgenKitAsset.Colors.primaryDark1.color
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private var inputEmailTF = CustomTextField().then {
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var underLine = UIView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    private let emailTypeLabel = UILabel().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = MukgenKitAsset.Colors.primaryLight2.color.cgColor
        $0.layer.cornerRadius = 6
        $0.text = "@dsm.hs.kr"
        $0.backgroundColor = .clear
        $0.textColor = MukgenKitAsset.Colors.primaryLight1.color
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }

    private let nextPageButton = CustomButton(title: "다음",
                                              backgroundColor: MukgenKitAsset.Colors.primaryLight2.color, titleColor: UIColor.white,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
        $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    }
    
    public override func layout() {
        [
            progressEmailLabel,
            guideInputEmail,
            inputEmailTF,
            underLine,
            emailTypeLabel,
            nextPageButton
        ].forEach { view.addSubview($0) }
        
        
        progressEmailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(123.0)
            $0.leading.equalToSuperview().offset(20.0)
        }
        
        guideInputEmail.snp.makeConstraints {
            $0.top.equalTo(progressEmailLabel.snp.bottom).offset(12.0)
            $0.leading.equalToSuperview().offset(20.0)
        }
        
        inputEmailTF.snp.makeConstraints {
            $0.top.equalTo(guideInputEmail.snp.bottom).offset(24.0)
            $0.leading.equalToSuperview().offset(20.0)
            $0.height.equalTo(71.0)
        }
        
        underLine.snp.makeConstraints {
            $0.top.equalTo(inputEmailTF.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(2)
        }
        
        emailTypeLabel.snp.makeConstraints {
            $0.top.equalTo(guideInputEmail.snp.bottom).offset(40.0)
            $0.trailing.equalToSuperview().inset(30.0)
            $0.width.equalTo(112)
            $0.height.equalTo(39)
        }
        
        nextPageButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(55)
        }
    }
    
    public override func attribute() {
        view.backgroundColor = .white
        
        lazy var textFields = [inputEmailTF]
        let placeholders = "이메일 주소"
        
        var index = 0
        for textField in textFields {
            textField.attributedPlaceholder = NSAttributedString(string: placeholders,
                                                                 attributes: attributes)
            textField.delegate = self
            index += 1
        }
        setupTextFieldObservers()
        setupKeyboardObservers()
    }
    
    deinit {
        removeKeyboardObservers()
    }
    
    private func updateButtonColor() {
        if inputEmailTF.text?.isEmpty == false  && inputEmailTF.validateEmail() {
            DispatchQueue.main.async {
                self.nextPageButton.backgroundColor = MukgenKitAsset.Colors.pointBase.color
            }
        } else {
            DispatchQueue.main.async {
                self.nextPageButton.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
            }
        }
    }
    
    private func setupTextFieldObservers() {
        inputEmailTF.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
    }
    
    private func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
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
    
    @objc func nextPageButtonDidTap(_ sender: Any) {
        guard let email = inputEmailTF.text, !email.isEmpty else {
            return
        }
        
        if !inputEmailTF.validateEmail() {
            return
        }
        self.navigationController?.pushViewController(InputIdPasswordViewController(), animated: true)
    }

    @objc private func textFieldContentDidChange(_ textField: UITextField) {
        updateButtonColor()
        
        if let customTextField = textField as? CustomTextField {
            _ = customTextField.validateEmail()
        }
    }
    

}

extension InputEmailViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if let customTextField = textField as? CustomTextField {
            _ = customTextField.validateEmail()
        }
        switch textField {
        case inputEmailTF:
            animate(line: underLine)
            underLine.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        default:
            underLine.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
        underLine.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
   }
}

extension CustomTextField {
    public func isValidEmail(_ email: String) -> Bool {
        let pattern = "^\\w+(@dsm+\\.hs+\\.kr)$"
        if let regex = try? NSRegularExpression(pattern: pattern) {
            let range = NSRange(location: 0, length: email.utf16.count)
            
            return regex.firstMatch(in: email, range: range) != nil
        }
        return false
    }
    
    func validateEmail() -> Bool {
        guard let text = self.text, !text.isEmpty else {
            setMessage("이메일을 입력해 주세요.", color: MukgenKitAsset.Colors.primaryLight2.color)
            return false
        }
        
        if !isValidEmail(text + "@dsm.hs.kr") {
            setMessage("잘못된 유형의 이메일 주소 입니다.", color: .red)
               return false
           }
        setMessage(nil)
        return true
    }
}
