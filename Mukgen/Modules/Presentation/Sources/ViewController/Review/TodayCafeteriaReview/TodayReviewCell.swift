import UIKit
import SnapKit
import Then
import MukgenKit

class TodayReviewCell: UICollectionViewCell {
    
    static let TodayReviewCell = "TodayReviewCell"
    
    var reviewTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "햄스터볶음밥"
        $0.textColor = .black
    }
    
    var starImageViews: [UIImageView] = (0..<5).map { _ in
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = MukgenKitAsset.Colors.pointLight1.color
        return imageView
    }
    
    lazy var starStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: starImageViews)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    var dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "23.05.08"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    var timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = " | 11:00"
        $0.textColor = MukgenKitAsset.Colors.primaryLight1.color
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        $0.layer.cornerRadius = 10.0
    }
    
    var nameLabel = UILabel().then {
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "박준하"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(starStackView)
        starStackView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(14)
            $0.width.equalTo(120.0)
            $0.height.equalTo(24.0)
        }
        
        contentView.addSubview(reviewTitle)
        reviewTitle.snp.makeConstraints {
            $0.top.equalTo(starStackView.snp.bottom).offset(4.0)
            $0.left.equalToSuperview().offset(16)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(reviewTitle.snp.bottom).offset(8.0)
            $0.left.equalTo(reviewTitle.snp.left)
            $0.bottom.equalToSuperview().inset(14.0)
        }
        
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.top)
            $0.leading.equalTo(dateLabel.snp.trailing)
            $0.bottom.equalToSuperview().inset(14.0)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(starStackView.snp.top)
            $0.trailing.equalToSuperview().inset(15.0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
