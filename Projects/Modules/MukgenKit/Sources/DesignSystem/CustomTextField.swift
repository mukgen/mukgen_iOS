import UIKit
import SnapKit
import Then

open class CustomTextField: UITextField {
    public let messageLabel = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupMessageLabel()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMessageLabel()
    }
    
    private func setupMessageLabel() {
        messageLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        messageLabel.numberOfLines = 0
        messageLabel.textColor = MukgenKitAsset.Colors.pointLight2.color
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    public func setMessage(_ message: String?,  color: UIColor = .red) {
        messageLabel.text = message
        messageLabel.textColor = color
    }
}
