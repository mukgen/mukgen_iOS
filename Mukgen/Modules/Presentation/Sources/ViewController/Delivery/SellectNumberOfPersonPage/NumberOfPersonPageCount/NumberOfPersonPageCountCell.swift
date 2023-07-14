import UIKit
import SnapKit
import Then

class NumberOfPersonPageCountCell: UICollectionViewCell {
    
    static let id = "NumberOfPersonPageCountCell"
    
    var countPage = UILabel().then {
        $0.text = "2 / 4"
        $0.textColor = PresentationAsset.Colors.primaryLight2.color
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


