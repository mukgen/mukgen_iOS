import UIKit
import SnapKit
import Then
import Domain
import RxCocoa
import RxSwift
import Core

//선 코드 수정 필요 일단은 false로 쓰자
open class InfoButton: UIButton {
    public var underlineEnabled: Bool = true {
        didSet {
            updateUnderline()
        }
    }
    
    private var underlineView: UIView?
    
    public convenience init(buttonTitle: String, underlineEnabled: Bool = true, titleColor: UIColor) {
        self.init(frame: .zero)
        self.underlineEnabled = underlineEnabled
        self.setTitleColor(titleColor, for: .normal)
        setTitle(buttonTitle, for: .normal)
        configureUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    open func configureUI() {
        titleLabel?.font = .systemFont(ofSize: 10.0, weight: .medium)
        setTitleColor(INFOKitAsset.Colors.mainColor.color, for: .normal)
        
        updateUnderline()
    }
    
    private func updateUnderline() {
        underlineView?.removeFromSuperview()
        
        if underlineEnabled {
            underlineView = UIView().then {
                $0.backgroundColor = INFOKitAsset.Colors.mainColor.color
            }
            addSubview(underlineView!)
            underlineView?.snp.makeConstraints {
                $0.leading.trailing.bottom.equalToSuperview()
                $0.height.equalTo(0.5)
            }
        }
    }
}
