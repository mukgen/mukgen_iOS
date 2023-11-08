import UIKit
import SnapKit
import Then
import Core

public class CustomTextView: UIView {
    let titleLabel: UILabel
    public let textView: UITextView
    let countLabel: UILabel
    
    let placeholder = "내용을 입력해주세요"
    var maxCharacterCount: Int
    var textViewHeight: CGFloat
    
    public init(maxCharacterCount: Int = 300, textViewHeight: CGFloat = 190, titleText: String) {
        self.maxCharacterCount = maxCharacterCount
        self.textViewHeight = textViewHeight
        
        titleLabel = UILabel().then {
            $0.text = titleText
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.textAlignment = .right
        }
        
        textView = UITextView().then {
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
            $0.tintColor = .black
            $0.textContainerInset = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        }
        
        countLabel = UILabel().then {
            $0.text = "0/\(maxCharacterCount)"
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = MukgenKitAsset.Colors.pointLight2.color
            $0.textAlignment = .right
        }
        
        super.init(frame: .zero)
        
        layout()
        attribute()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(titleLabel)
        addSubview(textView)
        addSubview(countLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.top.equalToSuperview()
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            $0.height.equalTo(textViewHeight)
            $0.leading.trailing.equalToSuperview().inset(20.0)
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalTo(textView.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(28)
        }
    }
    
    private func attribute() {
        textView.delegate = self
        textView.text = placeholder
        textView.textColor = .gray
    }
}

extension CustomTextView: UITextViewDelegate {
    public func textViewDidBeginEditing(_ textView: UITextView) {
        textView.layer.borderWidth = 1
        textView.layer.borderColor = MukgenKitAsset.Colors.pointBase.color.cgColor
        
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.textColor = .gray
            textView.text = placeholder
        } else if textView.text == placeholder {
            textView.textColor = .black
            textView.text = nil
        }
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > maxCharacterCount {
            textView.deleteBackward()
        }
        
        countLabel.text = "\(textView.text.count)/\(maxCharacterCount)"
        
        let attributedString = NSMutableAttributedString(string: "\(textView.text.count)/\(maxCharacterCount)")
        attributedString.addAttribute(.foregroundColor, value: MukgenKitAsset.Colors.pointBase.color, range: ("\(textView.text.count)/\(maxCharacterCount)" as NSString).range(of:"\(textView.text.count)"))
        countLabel.attributedText = attributedString
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        textView.layer.borderWidth = 0
        
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textView.text == placeholder {
            textView.textColor = MukgenKitAsset.Colors.primaryLight2.color
            textView.text = placeholder
            countLabel.textColor = MukgenKitAsset.Colors.primaryLight2.color
            countLabel.text = "0/\(maxCharacterCount)"
        }
    }
}
