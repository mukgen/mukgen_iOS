import UIKit
import SnapKit
import Then

class BoardTitleCell: UICollectionViewCell {
    
    static let id = "customCell"
    
    var boardText = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.text = "급식 게시판"
        $0.textColor = .black
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
        
        contentView.addSubview(boardText)
        boardText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(0)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

