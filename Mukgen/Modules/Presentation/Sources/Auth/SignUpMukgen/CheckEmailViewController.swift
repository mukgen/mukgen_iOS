import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class CheckEmailViewController: BaseVC {
    public var factory: ModuleFactoryInterface!
    
    
    private let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: MukgenKitAsset.Colors.primaryLight2.cgColor,
        .font: UIFont.systemFont(ofSize: 20, weight: .semibold)
    ]
    
    private let inputCertificationNumberLabel = UILabel().then {
        $0.text = "인증번호를 입력해주세요."
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private lazy var  guideCheckEmailLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.numberOfLines = 2
        let email = "leh1314@dsm.hs.kr"
        let text = "\(email) 로 메일이 전송되었습니다.\n메일이 오지 않으면 스팸함을 확인해주세요."
        let attributedText = NSMutableAttributedString(string: text, attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ])
        
        if let range = text.range(of: "\(email)") {
            attributedText.addAttributes([
                .foregroundColor: MukgenKitAsset.Colors.pointBase.color
            ], range: NSRange(range, in: text))
        }
        $0.attributedText = attributedText
    }
    
    public lazy var checkEmailTFs: [CustomTextField] = {
        let checkEmailTF1 = CustomTextField()
        let checkEmailTF2 = CustomTextField()
        let checkEmailTF3 = CustomTextField()
        let checkEmailTF4 = CustomTextField()
        let checkEmailTF5 = CustomTextField()
        let checkEmailTF6 = CustomTextField()

        let textFields = [checkEmailTF1, checkEmailTF2, checkEmailTF3, checkEmailTF4, checkEmailTF5, checkEmailTF6]

        for textField in textFields {
            textField.font = .systemFont(ofSize: 24, weight: .semibold)
            textField.layer.borderWidth = 1
            textField.layer.borderColor = MukgenKitAsset.Colors.pointBase.color.cgColor
            textField.layer.cornerRadius = 6
            textField.textAlignment = .center
            textField.keyboardType = .numberPad
            textField.tintColor = .black
        }

        return textFields
    }()
    
    private lazy var noSendedNumLabel = UILabel().then {
        $0.text = "이메일을 받지 못하셨나요?"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = MukgenKitAsset.Colors.primaryDark1.color
    }
    
    private lazy var resendNumButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.setTitle("재전송하기", for: .normal)
        $0.setTitleColor(MukgenKitAsset.Colors.pointBase.color, for: .normal)
    }
    
    private lazy var nextPageButton = CustomButton(
        title: "다음",
        backgroundColor: MukgenKitAsset.Colors.primaryLight2.color,
        titleColor: .white,
        font: UIFont.systemFont(ofSize: 16, weight: .semibold))
    //    ).then {
    //        $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    //    }
    
    public override func layout() {
        checkEmailTFs.forEach { view.addSubview($0) }
        [
            inputCertificationNumberLabel,
            guideCheckEmailLabel,
            noSendedNumLabel,
            resendNumButton,
            nextPageButton
        ].forEach { view.addSubview($0) }
        
        inputCertificationNumberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(123)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(29)
        }
        
        guideCheckEmailLabel.snp.makeConstraints {
            $0.top.equalTo(inputCertificationNumberLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(40.0)
        }
        
        for i in 0..<checkEmailTFs.count {
            checkEmailTFs[i].snp.makeConstraints() {
                $0.top.equalTo(guideCheckEmailLabel.snp.bottom).offset(34)
                if i == 0 {
                    $0.left.equalToSuperview().offset(20)
                } else {
                    $0.left.equalTo(checkEmailTFs[i - 1].snp.right).offset(9)
                }
                $0.width.equalTo(51.17)
                $0.height.equalTo(56)
            }
        }
        
        noSendedNumLabel.snp.makeConstraints {
            $0.bottom.equalTo(nextPageButton.snp.top).inset(-10)
            $0.height.equalTo(16)
            $0.width.equalTo(169)
            $0.leading.equalToSuperview().offset(20)
        }
        
        resendNumButton.snp.makeConstraints {
            $0.bottom.equalTo(nextPageButton.snp.top).inset(-10)
            $0.height.equalTo(19)
            $0.width.equalTo(70)
            $0.left.equalTo(noSendedNumLabel.snp.right).offset(10)
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
        
        checkEmailTFs.enumerated().forEach { index, textField in
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "",
                                                                 attributes: attributes)
            textField.delegate = self
            textField.tag = index + 1
            textField.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
        }
        
        setupKeyboardObservers()
    }

    
    private func createTextField(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.tintColor = .black
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textField.textAlignment = .center
        textField.textColor = .black
        return textField
    }
    
    private func updateButtonColor() {
        let isEmpty = checkEmailTFs.allSatisfy { !$0.text!.isEmpty }
        DispatchQueue.main.async {
            self.nextPageButton.backgroundColor = isEmpty ? MukgenKitAsset.Colors.pointBase.color : MukgenKitAsset.Colors.primaryLight2.color
        }
    }
    
    @objc private func textFieldContentDidChange(_ textField: UITextField) {
        updateButtonColor()
    }
    
    @objc private func nextPageButtonDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(InputTelViewController(), animated: true)
    }
    
    deinit {
        removeKeyboardObservers()
    }
}


extension CheckEmailViewController: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard textField.text!.count < 1 else { return false }
        return true
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let index = checkEmailTFs.firstIndex(of: textField as! CustomTextField) {
            if index < checkEmailTFs.count - 1 {
                checkEmailTFs[index + 1].becomeFirstResponder()
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
