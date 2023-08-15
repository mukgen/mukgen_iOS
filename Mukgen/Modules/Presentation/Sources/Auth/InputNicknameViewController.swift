import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class InputNicknameViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    private let attributes = [NSAttributedString.Key.foregroundColor: MukgenKitAsset.Colors.primaryLight2.color,
                          .font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
    
    private let inputNicknameLabel = UILabel().then {
        $0.text = "별명을 입력해주세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }

    private var firstTextField = CustomTextField().then {
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var nicknameLine = UIView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    private let nextPageButton = CustomButton(title: "다음",
                                              backgroundColor: MukgenKitAsset.Colors.primaryLight2.color, titleColor: UIColor.white,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
        $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    }
    
    public override func layout() {
        view.addSubview(inputNicknameLabel)
        view.addSubview(firstTextField)
        view.addSubview(nicknameLine)
        view.addSubview(nextPageButton)

        inputNicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(123)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(29)
        }

        firstTextField.snp.makeConstraints { 
            $0.top.equalTo(inputNicknameLabel.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(56)
        }

        nicknameLine.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(2)
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
        
        lazy var textFields = [firstTextField]
        let placeholders = "별명"
        
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
        if firstTextField.text?.isEmpty == false, firstTextField.text!.count <= 8 {
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
    
    @objc func nextPageButtonDidTap(_ sender: Any) {
        guard let nickname = firstTextField.text, !nickname.isEmpty else {
            return
        }
        
        self.navigationController?.pushViewController(InputIdPasswordViewController(), animated: true)
    }

    @objc private func textFieldContentDidChange(_ textField: UITextField) {
        updateButtonColor()
        
        if let customTextField = textField as? CustomTextField {
            customTextField.validateNickname()
        }
    }
}

extension InputNicknameViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if let customTextField = textField as? CustomTextField {
            customTextField.validateNickname()
        }
        switch textField {
        case firstTextField:
            animate(line: nicknameLine)
            nicknameLine.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        default:
            nicknameLine.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
        nicknameLine.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
   }
}

extension CustomTextField {
    func validateNickname() -> Bool {
        guard let text = self.text, !text.isEmpty, text.count >= 1 else {
            setMessage("최대 8자", color: MukgenKitAsset.Colors.primaryLight2.color)
            return false
    }
    
    if text.count > 8 {
        setMessage("별명은 최대 8자까지 가능합니다.", color: .red)
        return false
    }
        
        setMessage(nil)
        return true
    }
}



