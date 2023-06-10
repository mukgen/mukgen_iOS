import UIKit
import SnapKit
import Then

class ShowFilterCell: UICollectionViewCell {
    
    static let id = "customCell"
    
    var boardText = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.text = "급식 게시판"
        $0.textColor = .black
    }
    
    var tasteGoodText = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        $0.setTitle("일간", for: .normal)
//        $0.layer.borderWidth = 1
//        $0.layer.borderColor =
//        $0.layer.cornerRadius = 100.0
//        $0.font = .systemFont(ofSize: 12, weight: .regular)
//        $0.text = "맛있을 것 같은 급식의 날"
        $0.tintColor = PresentationAsset.Colors.pointBase.color
    }
    
    var todayDate = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.text = "5월 10일"
        $0.textColor = PresentationAsset.Colors.pointBase.color
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = .red
//        $0.layer.cornerRadius = 10.0
//        $0.layer.borderWidth = 2
//        $0.layer.borderColor = PresentationAsset.Colors.pointLight4.color.cgColor
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
        
//        contentView.addSubview(tasteGoodText)
//        tasteGoodText.snp.makeConstraints {
//            $0.top.equalTo(pickText.snp.bottom).offset(20)
//            $0.left.equalToSuperview().offset(24)
//        }
//
//        contentView.addSubview(todayDate)
//        todayDate.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(20)
//            $0.left.equalTo(tasteGoodText.snp.right).offset(100)
//        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
