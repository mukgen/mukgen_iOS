import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class SelectPlaceViewController: BaseVC {
    
    private let attributes = [NSAttributedString.Key.foregroundColor: MukgenKitAsset.Colors.primaryLight2.color,
                          .font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
    
    private let sellectPlaceText = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "어디서\n만나실 건가요?"
        $0.backgroundColor = .white
        $0.tintColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let pageCount = UILabel().then {
        $0.text = "3 / 4"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }

    private var selectPlaceTF = UITextField().then {
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var selectPlaceTFLine = UIView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    public var beforePageButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.setTitle("이전", for: .normal)
        $0.setTitleColor(MukgenKitAsset.Colors.pointBase.color, for: .normal)
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.systemOrange.cgColor
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        $0.layer.cornerRadius = 10.0
        $0.addTarget(self, action: #selector(beforePageButtonDidTap(_:)), for: .touchUpInside)
    }
    
    public var nextPageButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
        $0.layer.cornerRadius = 10.0
        $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    }
    
    public override func layout() {
        [
            pageCount,
            sellectPlaceText,
            selectPlaceTF,
            selectPlaceTFLine,
            nextPageButton
        ].forEach { view.addSubview($0) }

        
        pageCount.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(134)
            $0.right.equalToSuperview().inset(20)
        }
        
        sellectPlaceText.snp.makeConstraints() {
            $0.top.equalTo(pageCount.snp.bottom).offset(24.0)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        selectPlaceTF.snp.makeConstraints() {
            $0.top.equalTo(sellectPlaceText.snp.bottom).offset(40.0)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        selectPlaceTFLine.snp.makeConstraints() {
            $0.top.equalTo(selectPlaceTF.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(352)
            $0.height.equalTo(2)
        }
        
        view.addSubview(beforePageButton)
        beforePageButton.snp.makeConstraints {
            $0.width.equalTo(161.5)
            $0.height.equalTo(55.0)
            $0.bottom.equalToSuperview().inset(40.0)
            $0.left.equalToSuperview().offset(30.0)
        }
        
        view.addSubview(nextPageButton)
        nextPageButton.snp.makeConstraints {
            $0.width.equalTo(161.5)
            $0.height.equalTo(55.0)
            $0.bottom.equalToSuperview().inset(40.0)
            $0.left.equalTo(beforePageButton.snp.right).offset(10.0)
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    public override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false // 뷰 컨트롤러가 사라질 때 나타내기
    }

    
    public override func attribute() {
        
        view.backgroundColor = .white
        
        lazy var textFields = [selectPlaceTF]
        let placeholders = "장소"
        
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
        if selectPlaceTF.text?.isEmpty == false {
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
        selectPlaceTF.addTarget(self, action: #selector(textFieldContentDidChange(_:)), for: .editingChanged)
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
            
            UIView.animate(withDuration: 0.3) {
                self.beforePageButton.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight + 10)
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.nextPageButton.transform = .identity
        }
        UIView.animate(withDuration: 0.3) {
            self.beforePageButton.transform = .identity
        }
    }
    
    private func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
    
    @objc func beforePageButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextPageButtonDidTap(_ sender: UIButton) {
        guard let text = selectPlaceTF.text, !text.isEmpty else {
            return
        }
        self.navigationController?.pushViewController(SelectTimeViewController(), animated: true)
    }
    
    @objc private func textFieldContentDidChange(_ textField: UITextField) {
        updateButtonColor()
    }

}

extension SelectPlaceViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case selectPlaceTF:
            animate(line: selectPlaceTFLine)
            selectPlaceTFLine.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        default: return
        }
    }
}
