
import UIKit
import SnapKit
import Then

class PopularPostViewCell: UICollectionViewCell {
    
    static let id = "PopularPostViewCell"
    
    var popularText1 = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "제주도 가고싶다"
        $0.textColor = .black
    }
   
    public var backView = UIImageView().then {
        $0.backgroundColor = PresentationAsset.Colors.primaryLight3.color
        $0.layer.cornerRadius = 10.0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(popularText1)
        popularText1.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(16)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
