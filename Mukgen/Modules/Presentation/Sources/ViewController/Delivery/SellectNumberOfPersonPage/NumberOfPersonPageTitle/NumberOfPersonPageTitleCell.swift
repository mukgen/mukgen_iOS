import UIKit
import SnapKit
import Then

class NumberOfPersonPageTitleCell: UICollectionViewCell {
    
    static let id = "SellectPageCell"
    
    var countPage = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "몇명을\n모집하시나요?"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
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
            $0.left.equalToSuperview().offset(0)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



