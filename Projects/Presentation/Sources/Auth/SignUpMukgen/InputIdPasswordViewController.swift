import UIKit
import SnapKit
import Then
import Core
import MukgenKit

public class InputIdPasswordViewController: BaseVC {
    public var factory: ModuleFactoryInterface!
    
    private let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: MukgenKitAsset.Colors.primaryLight2.color,
        .font: UIFont.systemFont(ofSize: 20, weight: .semibold)
    ]
    
    private lazy var inputIdPasswordLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "아이디와\n비밀번호를 입력해주세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private lazy var showPWButton1 = UIButton().then {
        $0.setImage(MukgenKitAsset.Assets.eye.image, for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(hidePWField), for: [.touchUpInside, .touchDragExit])
        $0.addTarget(self, action: #selector(showPWField), for: [.touchDown, .touchDragEnter])
    }
    
    private lazy var showPWButton2 = UIButton().then {
        $0.setImage(MukgenKitAsset.Assets.eye.image, for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(hideCheckPWField), for: [.touchUpInside, .touchDragExit])
        $0.addTarget(self, action: #selector(showCheckPWField), for: [.touchDown, .touchDragEnter])

    }
    
    public lazy var textFields: [CustomTextField] = {
        let textField1 = CustomTextField()
        textField1.placeholder = "아이디"
        let textField2 = CustomTextField()
        textField2.isSecureTextEntry = true
        textField2.placeholder = "비밀번호"
        let textField3 = CustomTextField()
        textField3.isSecureTextEntry = true
        textField3.placeholder = "비밀번호 확인"
        return [textField1, textField2, textField3]
    }()
    
    private lazy var lines: [UIView] = {
        let line1 = createLineView()
        let line2 = createLineView()
        let line3 = createLineView()
        return [line1, line2, line3]
    }()
    
    private lazy var nextPageButton = CustomButton(
        title: "다음",
        backgroundColor: MukgenKitAsset.Colors.primaryLight2.color,
        titleColor: .white,
        font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
        $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    }
    
    public override func layout() {
        textFields.forEach { view.addSubview($0) }
        lines.forEach { view.addSubview($0) }
        [
            inputIdPasswordLabel,
            showPWButton1,
            showPWButton2,
            nextPageButton
        ].forEach({ view.addSubview($0) })
        
        inputIdPasswordLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(112)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        showPWButton1.snp.makeConstraints {
            $0.centerY.equalTo(textFields[1])
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(24)
        }
        
        showPWButton2.snp.makeConstraints {
            $0.centerY.equalTo(textFields[2])
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(24)
        }
        
        for i in 0..<textFields.count {
            textFields[i].snp.makeConstraints() {
                if i == 0 {
                    $0.top.equalTo(inputIdPasswordLabel.snp.bottom).offset(24)
                } else {
                    $0.top.equalTo(textFields[i - 1].snp.bottom).offset(53)
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
    
    
    @objc private func showPWField() {
        textFields[1].isSecureTextEntry = false
        showPWButton1.setImage(MukgenKitAsset.Assets.colorEye.image, for: .normal)
    }

    @objc private func hidePWField() {
        textFields[1].isSecureTextEntry = true
        showPWButton1.setImage(MukgenKitAsset.Assets.eye.image, for: .normal)
    }
    
    @objc private func showCheckPWField() {
        textFields[2].isSecureTextEntry = false
        showPWButton2.setImage(MukgenKitAsset.Assets.colorEye.image, for: .normal)
    }

    @objc private func hideCheckPWField() {
        textFields[2].isSecureTextEntry = true
        showPWButton2.setImage(MukgenKitAsset.Assets.eye.image, for: .normal)
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
            self.nextPageButton.backgroundColor = isEmpty ? MukgenKitAsset.Colors.pointBase.color : MukgenKitAsset.Colors.primaryLight2.color
        }
    }
    
    @objc private func textFieldContentDidChange(_ textField: UITextField) {
        updateButtonColor()
        
        switch textField {
        case textFields[0]:
            if let customTextField = textField as? CustomTextField {
                _ = customTextField.validateInputId()
            }
        case textFields[1]:
            if let customTextField = textField as? CustomTextField {
                _ = customTextField.validateInputTel()
            }
        case textFields[2]:
            if let customTextField = textField as? CustomTextField {
                _ = customTextField.validatecheckTel()
            }
        default:
            return
        }
    }

    
    @objc private func nextPageButtonDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(InputTelViewController(), animated: true)
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

extension InputIdPasswordViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case textFields[0]:
            if let customTextField = textField as? CustomTextField {
                _ = customTextField.validateInputId()
            }
            animate(line: lines[0])
            lines[0].backgroundColor = MukgenKitAsset.Colors.pointBase.color
        case textFields[1]:
            if let customTextField = textField as? CustomTextField {
                _ = customTextField.validateInputTel()
            }
            animate(line: lines[1])
            lines[1].backgroundColor = MukgenKitAsset.Colors.pointBase.color
        case textFields[2]:
            if let customTextField = textField as? CustomTextField {
                _ = customTextField.validatecheckTel()
            }
            animate(line: lines[2])
            lines[2].backgroundColor = MukgenKitAsset.Colors.pointBase.color
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
                self.nextPageButton.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight + 30)
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
    public func isValidPW(_ password: String) -> Bool {
        let pattern = "^(?=.*[!@#$%^&*])(?=.{1,20}$).*"
        if let regex = try? NSRegularExpression(pattern: pattern) {
            let range = NSRange(location: 0, length: password.utf16.count)
            
            return regex.firstMatch(in: password, range: range) != nil
        }
        return false
    }
    
    func validateInputId() -> Bool {
        guard let text = self.text, !text.isEmpty else {
            setMessage("최소 5자, 최대 15자", color: MukgenKitAsset.Colors.primaryLight2.color)
            return false
        }
        
        if text.count < 5 || text.count > 15 {
            setMessage("조건에 맞지 않습니다.", color: .systemRed)
            return false
        }
        
        setMessage("사용가능한 아이디 입니다.", color: .systemGreen)
        return true
    }
    
    func validateInputTel() -> Bool {
        guard let text = self.text, !text.isEmpty else {
            setMessage("특수문자 최소 1자 포함, 최대 20자", color: MukgenKitAsset.Colors.primaryLight2.color)
            return false
        }
        
        if !isValidPW(text) {
            setMessage("조건에 맞지 않습니다.", color: .red)
            return false
        }
        
        setMessage("사용가능한 비밀번호 입니다", color: .systemGreen)
        return true
    }
    
    func validatecheckTel() -> Bool {
        guard let text = self.text, !text.isEmpty, text.count >= 1 else {
            setMessage(nil)
            return false
        }
        
        if text.count < 5 || text.count > 15 {
            setMessage("조건에 맞지 않습니다", color: .systemRed)
            return false
        }
        
        setMessage("비밀번호가 일치합니다.", color: .systemGreen)
        return true
    }
}
