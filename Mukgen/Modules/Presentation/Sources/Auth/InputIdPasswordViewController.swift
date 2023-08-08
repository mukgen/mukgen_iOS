import UIKit
import SnapKit
import Then
import Core
import MukgenKit

public class InputIdPasswordViewController: BaseVC {
    public var factory: ModuleFactoryInterface!

    private let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: MukgenKitAsset.Colors.primaryLight2.cgColor,
        .font: UIFont.systemFont(ofSize: 20, weight: .semibold)
    ]

    private lazy var inputIdPasswordLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "아이디와\n비밀번호를 입력해주세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private lazy var placeHolder1 = UILabel().then {
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
        $0.text = "최소 5자, 최대 15자"
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private lazy var placeHolder2 = UILabel().then {
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
        $0.text = "특수문자 최소 1자 포함, 최대 20자"
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }

    private lazy var textFields: [UITextField] = {
        let textField1 = createTextField(withPlaceholder: "아이디")
        let textField2 = createTextField(withPlaceholder: "비밀번호")
        let textField3 = createTextField(withPlaceholder: "비밀번호 확인")
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
        view.addSubview(inputIdPasswordLabel)
        textFields.forEach { view.addSubview($0) }
        lines.forEach { view.addSubview($0) }
        view.addSubview(nextPageButton)
        view.addSubview(placeHolder1)
        view.addSubview(placeHolder2)

        inputIdPasswordLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(123)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        placeHolder1.snp.makeConstraints() {
            $0.top.equalTo(inputIdPasswordLabel.snp.bottom).offset(90.0)
            $0.leading.trailing.equalToSuperview().offset(20)
        }
        
        placeHolder2.snp.makeConstraints() {
            $0.top.equalTo(placeHolder1.snp.bottom).offset(60.0)
            $0.leading.trailing.equalToSuperview().offset(20)
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
            animate(line: lines[0])
            lines[0].backgroundColor = MukgenKitAsset.Colors.pointBase.color
        case textFields[1]:
            animate(line: lines[1])
            lines[1].backgroundColor = MukgenKitAsset.Colors.pointBase.color
        case textFields[2]:
            animate(line: lines[2])
            lines[2].backgroundColor = MukgenKitAsset.Colors.pointBase.color
        default:
            return
        }
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let index = textFields.firstIndex(of: textField) {
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
