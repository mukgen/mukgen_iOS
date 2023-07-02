import UIKit
import SnapKit
import Then

class ScrollNumberOfPersonPageCell: UICollectionViewCell {
    
    static let id = "ScrollNumberOfPersonPageCell"
    
    var boardText = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.text = "에러티비"
        $0.textColor = .black
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = PresentationAsset.Colors.primaryLight3.color
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(boardText)
        boardText.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



