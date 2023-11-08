import UIKit
import SnapKit
import Then
import MukgenKit

class ShowFilterCell: UICollectionViewCell {
    
    static let id = "customCell"
    
    public var onToggleTap: (() -> Void)?
    
    public var filterToggle = UIButton().then {
        $0.layer.cornerRadius = 100
        $0.backgroundColor = .clear
        $0.setTitleColor(MukgenKitAsset.Colors.primaryLight1.color, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        $0.setTitle("전체", for: .normal)
    }
    
    var todayDate = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.text = "5월 10일"
        $0.textColor = MukgenKitAsset.Colors.pointBase.color
    }
    
    public var filterBackView = UIImageView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 17.5

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(filterBackView)
        filterBackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(filterToggle)
        filterToggle.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(35.0)
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            
        }
        
        filterToggle.layer.borderWidth = 1
        filterToggle.layer.borderColor = MukgenKitAsset.Colors.primaryLight2.color.cgColor
        filterToggle.layer.cornerRadius = 17.5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleDidTap))
        filterToggle.addGestureRecognizer(tapGesture)
    }
    
    @objc private func toggleDidTap() {
        onToggleTap?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

