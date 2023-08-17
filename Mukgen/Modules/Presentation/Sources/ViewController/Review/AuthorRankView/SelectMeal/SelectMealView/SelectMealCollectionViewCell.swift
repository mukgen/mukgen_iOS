import UIKit
import SnapKit
import Then
import MukgenKit

class SelectMealCollectionViewCell: UICollectionViewCell {
    
    static let id = "SelectMealCollecionViewCell"
    
    public var selectMealBackView = UIImageView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        $0.layer.cornerRadius = 10.0
    }
    
    var riceTypeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = MukgenKitAsset.Colors.pointBase.color
    }
    
    var riceTypeImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.breakfastImage.image
    }
    
    var riceIdLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = MukgenKitAsset.Colors.primaryBase.color
    }
    
    var todayMenu = UILabel().then {
        $0.numberOfLines = 5
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        let text = "유지우\n이은호\n이태영\n부현수\n김어진"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        
        let attributedString = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.black
        ])
        
        $0.attributedText = attributedString

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [
            selectMealBackView,
            riceTypeLabel,
            riceTypeImage,
            riceIdLabel,
            todayMenu
        ].forEach { contentView.addSubview( $0) }
        
        selectMealBackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        riceTypeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(60)
        }
        
        riceTypeImage.snp.makeConstraints {
            $0.top.equalTo(riceTypeLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(42)
            $0.width.height.equalTo(64)
        }
        
        riceIdLabel.snp.makeConstraints {
            $0.top.equalTo(riceTypeImage.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(41.5)
        }
        
        todayMenu.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44.5)
            $0.leading.equalTo(riceTypeLabel.snp.trailing).offset(60)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
