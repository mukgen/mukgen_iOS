import UIKit
import SnapKit
import Then
import Core
import MukgenKit

public class InputIdPasswordViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    private let attributes = [NSAttributedString.Key.foregroundColor: MukgenKitAsset.Colors.primaryLight2.cgColor,
                              .font : UIFont.systemFont(ofSize: 20, weight: .semibold)] as [NSAttributedString.Key : Any]
    
    private let inputIdPasswordLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "아이디와\n비밀번호를 입력해주세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private var firstTextField = UITextField().then {
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var secondTextField = UITextField().then {
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var thirdTextField = UITextField().then {
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var idLine = UIView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    private var passwordLine = UIView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    private var checkPasswordLine = UIView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    private let nextPageButton = CustomButton(title: "다음",
                                              backgroundColor: MukgenKitAsset.Colors.primaryLight2.color, titleColor: UIColor.white,
                                              font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    )
    
    public override func layout() {
        
        [
            inputIdPasswordLabel,
            firstTextField,
            idLine,
            secondTextField,
            nextPageButton,
            thirdTextField,
            checkPasswordLine,
            passwordLine
        ].forEach { view.addSubview($0) }

        inputIdPasswordLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(123)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        firstTextField.snp.makeConstraints() {
            $0.top.equalTo(inputIdPasswordLabel.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        idLine.snp.makeConstraints() {
            $0.top.equalTo(firstTextField.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.height.equalTo(2)
        }
        
        secondTextField.snp.makeConstraints() {
            $0.top.equalTo(firstTextField.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        passwordLine.snp.makeConstraints() {
            $0.top.equalTo(secondTextField.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.height.equalTo(2)
        }
        
        thirdTextField.snp.makeConstraints() {
            $0.top.equalTo(passwordLine.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        checkPasswordLine.snp.makeConstraints() {
            $0.top.equalTo(thirdTextField.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.height.equalTo(2)
        }
        
        nextPageButton.snp.makeConstraints() {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(55)
        }
    }

    
    public override func attribute() {
        view.backgroundColor = .white
        
        lazy var textFields = [firstTextField, secondTextField, thirdTextField]
        let placeholders = ["아이디", "비밀번호", "비밀번호 확인"]
        
        var index = 0
        for textField in textFields {
            textField.attributedPlaceholder = NSAttributedString(string: placeholders[index],
                                                                 attributes: attributes)
            textField.delegate = self
            index += 1
        }
        
        nextPageButton.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
        
        setupTextFieldObservers()
        setupKeyboardObservers()
        configureTextFields()
    }
    
    private func configureTextFields() {
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        
        firstTextField.tag = 1
        secondTextField.tag = 2
        thirdTextField.tag = 3
        
        firstTextField.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
        thirdTextField.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
    }
    
    private func updateButtonColor() {
        if firstTextField.text?.isEmpty == false && secondTextField.text?.isEmpty == false && thirdTextField.text?.isEmpty == false {
            DispatchQueue.main.async {
                self.nextPageButton.backgroundColor = MukgenKitAsset.Colors.primaryBase.color
            }
        } else {
            DispatchQueue.main.async {
                self.nextPageButton.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
            }
        }
    }

    
    private func setupTextFieldObservers() {
        firstTextField.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
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
                self.nextPageButton.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight + 10) //만약 디자인에서 키보드와 거리가 표기되어있다면 keyoardHeight에 붙는 +를 바꾸면 붙는 간격을 바꿀 수 있습니다
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.nextPageButton.transform = .identity
        }
    }
    
    @objc private func textFieldContentDidChange(_ textField: UITextField) {
        updateButtonColor()
    }
    
    @objc func nextPageButtonDidTap(_ sender: Any) {
//        self.navigationController?.pushViewController(InputTelViewController(), animated: true)
    }
}

extension InputIdPasswordViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case firstTextField: animate(line: idLine)
            idLine.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        case secondTextField: animate(line: passwordLine)
            passwordLine.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        case thirdTextField: animate(line: checkPasswordLine)
            checkPasswordLine.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        default: return
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstTextField:
            secondTextField.becomeFirstResponder()
        case secondTextField:
            thirdTextField.becomeFirstResponder()
        case thirdTextField:
            thirdTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
        idLine.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
        passwordLine.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
        checkPasswordLine.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
   }
}
