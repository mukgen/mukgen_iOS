
import UIKit
import SnapKit
import Then

class DeliveryContentsCell: UICollectionViewCell {
    
    static let id = "DeliveryContentsCell"
    
    var writer = UILabel().then {
        $0.font = .systemFont(ofSize: 14.12, weight: .semibold)
        $0.text = "이은호"
        $0.textColor = .black
    }
    
    var contents = UILabel().then {
        $0.font = .systemFont(ofSize: 12.11, weight: .regular)
        $0.text = "PM이 맛있습니당!!"
        $0.textColor = .black
    }
    
    public var profileImage = UIImageView().then {
        $0.image = PresentationAsset.Images.testProfile.image
    }

    var heartBackView = UIView().then {
        $0.layer.cornerRadius = 8.07
        $0.backgroundColor = .white
    }
    
    var heartImage = UIImageView().then {
        $0.image = PresentationAsset.Images.tendinousHeart.image
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = .white
    }
    
    public var smallbackView = UIImageView().then {
        $0.backgroundColor = .none
    }

    
     var heartCount = UILabel().then {
        $0.font = .systemFont(ofSize: 12.11, weight: .bold)
        $0.text = "9"
        $0.textColor = PresentationAsset.Colors.primaryLight1.color
    }
    
    var noHeartBackView = UIView().then {
        $0.layer.cornerRadius = 8.07
        $0.backgroundColor = .white
    }
    
    var noHeartImage = UIImageView().then {
        $0.image = PresentationAsset.Images.noHeart.image
    }
    
    var noHeartCount = UILabel().then {
       $0.font = .systemFont(ofSize: 12.11, weight: .bold)
       $0.text = "9"
       $0.textColor = PresentationAsset.Colors.primaryLight1.color
   }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(writer)
        writer.snp.makeConstraints {
            $0.left.equalTo(backView.snp.left).offset(91.0)
            $0.top.equalToSuperview().offset(18.0)
        }
        
        contentView.addSubview(contents)
        contents.snp.makeConstraints {
            $0.left.equalTo(backView.snp.left).offset(91.0)
            $0.top.equalTo(writer.snp.bottom).offset(4.0)
        }
//
//        contentView.addSubview(heartBackView)
//        heartBackView.snp.makeConstraints {
//            $0.width.equalTo(40)
//            $0.height.equalTo(20)
//            $0.bottom.equalToSuperview().inset(12.0)
//            $0.left.equalToSuperview().offset(75.5)
//        }
        
//        contentView.addSubview(heartImage)
//        heartImage.snp.makeConstraints {
//            $0.left.equalTo(heartBackView.snp.left).offset(8.07)
//            $0.bottom.equalTo(heartBackView.snp.bottom).inset(4.45)
//        }
//
//        contentView.addSubview(heartCount)
//        heartCount.snp.makeConstraints {
//            $0.left.equalTo(heartImage.snp.right).offset(4.04)
//            $0.top.equalTo(heartBackView.snp.top).offset(2.5)
//        }
        
//        contentView.addSubview(noHeartBackView)
//        noHeartBackView.snp.makeConstraints {
//            $0.left.equalTo(heartBackView.snp.right).offset(4.0)
//            $0.width.equalTo(40)
//            $0.height.equalTo(20)
//            $0.bottom.equalToSuperview().inset(12.0)
//        }
        
//        contentView.addSubview(noHeartImage)
//        noHeartImage.snp.makeConstraints {
//            $0.left.equalTo(noHeartBackView.snp.left).offset(8.07)
//            $0.bottom.equalTo(noHeartBackView.snp.bottom).inset(4.45)
//        }
//
//        contentView.addSubview(noHeartCount)
//        noHeartCount.snp.makeConstraints {
//            $0.left.equalTo(noHeartImage.snp.right).offset(4.04)
//            $0.top.equalTo(noHeartBackView.snp.top).offset(2.5)
//        }
        
        contentView.addSubview(profileImage)
        profileImage.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(15)
            $0.left.equalTo(backView.snp.left).offset(16)
            $0.bottom.equalTo(backView.snp.bottom).inset(15)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




