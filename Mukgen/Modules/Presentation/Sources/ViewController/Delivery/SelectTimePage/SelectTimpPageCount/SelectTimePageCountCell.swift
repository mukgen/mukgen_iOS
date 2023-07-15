import UIKit
import SnapKit
import Then
import MukgenKit

class SelectTimePageCountCell: UICollectionViewCell {
    
    static let id = "SelectTimePageCountCell"
    
    var countPage = UILabel().then {
        $0.text = "4 / 4"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = .red
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(countPage)
        countPage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.right.equalToSuperview().inset(0)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



