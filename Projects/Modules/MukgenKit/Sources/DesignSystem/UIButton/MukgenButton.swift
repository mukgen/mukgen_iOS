import UIKit
import SnapKit
import Then

open class MukgenButton: UIButton {
    
    private let textLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    public init(
        type: MukgenButtonType
    ) {
        super.init(frame: .zero)
        
        textLabel.text = type.logoTitle
        textLabel.textColor = type.titleColor
        self.backgroundColor = type.backgroundColor
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = type.borderColor?.cgColor
        
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(textLabel)
        
        textLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    public func buttonColorChange(color: UIColor = MukgenKitAsset.Colors.pointBase.color) {
        self.backgroundColor = color
    }
}

