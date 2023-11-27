import UIKit
import SnapKit
import Then

open class CustomButton: UIButton {
    
    private let textLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    public init(
        title: String,
        backgroundColor: UIColor,
        titleColor: UIColor,
        font: UIFont? = UIFont.systemFont(ofSize: 15, weight: .bold)
    ) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        textLabel.text = title
        textLabel.textColor = titleColor
        textLabel.font = font
        
        layer.cornerRadius = 10
        
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
        
        snp.makeConstraints {
            $0.width.equalTo(353.0)
            $0.height.equalTo(55.0)
        }
    }
}

