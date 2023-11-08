import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class SellectMenuViewController: BaseVC {
    
    private let attributes = [NSAttributedString.Key.foregroundColor: MukgenKitAsset.Colors.primaryLight2.color,
                          .font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
    
    private let sellectMenuText = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "어떤 음식을\n배달 시키시나요?"
        $0.backgroundColor = .white
        $0.tintColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let pageCount = UILabel().then {
        $0.text = "1 / 4"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private lazy var textFields = [selectMenuTF]
    private let placeholders = "음식 이름"

    private var selectMenuTF = UITextField().then {
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
        $0.addTarget(self, action: #selector(nextPageButtonDidTap(_:)), for: .touchUpInside)
    }
    
    public override func layout() {
        [
            pageCount,
            sellectMenuText,
            selectMenuTF,
            nicknameLine,
            nextPageButton
        ].forEach { view.addSubview($0) }
        
        pageCount.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(134)
            $0.right.equalToSuperview().inset(20)
        }
        
        sellectMenuText.snp.makeConstraints() {
            $0.top.equalTo(pageCount.snp.bottom).offset(24.0)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        selectMenuTF.snp.makeConstraints() {
            $0.top.equalTo(sellectMenuText.snp.bottom).offset(40.0)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        nicknameLine.snp.makeConstraints() {
            $0.top.equalTo(selectMenuTF.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(352)
            $0.height.equalTo(2)
        }
        
        nextPageButton.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(40.0)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(353)
            $0.height.equalTo(55)
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    public override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    
    public override func attribute() {
        view.backgroundColor = .white

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
        if selectMenuTF.text?.isEmpty == false {
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
        selectMenuTF.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
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

    
    private func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
    
    @objc func nextPageButtonDidTap(_ sender: UIButton) {
        guard let nickname = selectMenuTF.text, !nickname.isEmpty else {
            return
        }
            self.navigationController?.pushViewController(SellectNumberOfPersonMainViewController(), animated: true)
    }
    
    @objc private func textFieldContentDidChange(_ textField: UITextField) {
        updateButtonColor()
        
        if let customTextField = textField as? CustomTextField {
            _ = customTextField.validateNickname()
        }
    }

}

extension SellectMenuViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case selectMenuTF:
            animate(line: nicknameLine)
            nicknameLine.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        default: return
        }
    }
}
