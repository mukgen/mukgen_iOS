import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class InputNicknameViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    private let attributes = [NSAttributedString.Key.foregroundColor: PresentationAsset.Colors.primaryLight2.color,
                          .font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
    
    private let inputNicknameLabel = UILabel().then {
        $0.text = "별명을 입력해주세요."
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
    
    private var nicknameLine = UIView().then {
        $0.backgroundColor = PresentationAsset.Colors.primaryLight2.color
    }
    
    private let nextPageButton = CustomButton(title: "다음",
                                              backgroundColor: PresentationAsset.Colors.primaryLight2.color, titleColor: UIColor.white,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
        $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    }
    
    public override func layout() {
        [
            inputNicknameLabel,
            firstTextField,
            nicknameLine,
            nextPageButton
        ].forEach { view.addSubview($0) }

        
        inputNicknameLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(123)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(29)
        }
        
        firstTextField.snp.makeConstraints() {
            $0.top.equalTo(inputNicknameLabel.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        nicknameLine.snp.makeConstraints() {
            $0.top.equalTo(firstTextField.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(352)
            $0.height.equalTo(2)
        }
        
        nextPageButton.snp.makeConstraints() {
            $0.top.equalTo(firstTextField.snp.bottom).offset(531)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(353)
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
    }
    
    private func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
    
    @objc func nextPageButtonDidTap(_ sender: Any) {
            self.navigationController?.pushViewController(InputIdPasswordViewController(), animated: true)
    }

}

extension InputNicknameViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case firstTextField:
            animate(line: nicknameLine)
            nicknameLine.backgroundColor = PresentationAsset.Colors.pointBase.color
        default: return
        }
    }
}
