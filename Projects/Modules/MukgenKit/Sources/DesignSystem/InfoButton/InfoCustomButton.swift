import UIKit

open class InfoCustomButton: UIButton {
    
    public init(
        title: String,
        backgroundColor: UIColor,
        titleColor: UIColor,
        font: UIFont? = UIFont.systemFont(ofSize: 14, weight: .bold)
    ) {
        let frame = CGRect(x: 0, y: 0, width: 330, height: 48)
        super.init(frame: frame)
        
        self.backgroundColor = backgroundColor
        setTitleColor(titleColor, for: .normal)
        
        layer.cornerRadius = 10
        
        setTitle(title, for: .normal)
        titleLabel?.font = font
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
