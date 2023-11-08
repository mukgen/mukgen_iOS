import UIKit
import SnapKit
import Then
import Domain
import RxCocoa
import RxSwift
import Core

open class InfoLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    open func configureUI() {
        font = .systemFont(ofSize: 10.0, weight: .medium)
        textColor = INFOKitAsset.Colors.dailyGrayColor.color
    }
    
    public convenience init(title: String) {
        self.init(frame: .zero)
        text = title
    }
}
