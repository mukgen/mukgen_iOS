import UIKit
import SnapKit
import Then
import MukgenKit

class TendinousCell: UICollectionViewCell {
    
    static let id = "TendinousCell"
    
    var writer = UILabel().then {
        $0.font = .systemFont(ofSize: 14.12, weight: .semibold)
        $0.text = "이은호"
        $0.textColor = MukgenKitAsset.Colors.primaryLight1.color
    }
    
    var contents = UILabel().then {
        $0.font = .systemFont(ofSize: 12.11, weight: .regular)
        $0.text = "PM이 맛있습니당!!"
        $0.textColor = .black
    }
    
    public var checkImage = UIImageView().then {
        $0.image = MukgenKitAsset.Assets.check.image
    }

    var heartBackView = UIView().then {
        $0.layer.cornerRadius = 8.07
        $0.backgroundColor = .white
    }
    
    var heartImage = UIImageView().then {
        $0.image = MukgenKitAsset.Assets.tendinousHeart.image
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = .white
    }
    
     var heartCount = UILabel().then {
        $0.font = .systemFont(ofSize: 12.11, weight: .bold)
        $0.text = "9"
        $0.textColor = MukgenKitAsset.Colors.primaryLight1.color
    }
    
    var noHeartBackView = UIView().then {
        $0.layer.cornerRadius = 8.07
        $0.backgroundColor = .white
    }
    
    var noHeartImage = UIImageView().then {
        $0.image = MukgenKitAsset.Assets.noHeart.image
    }
    
    var noHeartCount = UILabel().then {
       $0.font = .systemFont(ofSize: 12.11, weight: .bold)
       $0.text = "9"
       $0.textColor = MukgenKitAsset.Colors.primaryLight1.color
   }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(writer)
        writer.snp.makeConstraints {
            $0.left.equalTo(backView.snp.left).offset(20)
            $0.top.equalTo(backView.snp.top).offset(15.61)
        }
        
        contentView.addSubview(contents)
        contents.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.top.equalTo(writer.snp.bottom).offset(9.66)
        }
        
        contentView.addSubview(heartBackView)
        heartBackView.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(20)
            $0.bottom.equalToSuperview().inset(12.0)
            $0.left.equalToSuperview().offset(75.5)
        }
        
        contentView.addSubview(heartImage)
        heartImage.snp.makeConstraints {
            $0.left.equalTo(heartBackView.snp.left).offset(8.07)
            $0.bottom.equalTo(heartBackView.snp.bottom).inset(4.45)
        }
        
        contentView.addSubview(heartCount)
        heartCount.snp.makeConstraints {
            $0.left.equalTo(heartImage.snp.right).offset(4.04)
            $0.top.equalTo(heartBackView.snp.top).offset(2.5)
        }
        
        contentView.addSubview(noHeartBackView)
        noHeartBackView.snp.makeConstraints {
            $0.left.equalTo(heartBackView.snp.right).offset(4.0)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
            $0.bottom.equalToSuperview().inset(12.0)
        }
        
        contentView.addSubview(noHeartImage)
        noHeartImage.snp.makeConstraints {
            $0.left.equalTo(noHeartBackView.snp.left).offset(8.07)
            $0.bottom.equalTo(noHeartBackView.snp.bottom).inset(4.45)
        }
        
        contentView.addSubview(noHeartCount)
        noHeartCount.snp.makeConstraints {
            $0.left.equalTo(noHeartImage.snp.right).offset(4.04)
            $0.top.equalTo(noHeartBackView.snp.top).offset(2.5)
        }
        
        contentView.addSubview(checkImage)
        checkImage.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(20)
            $0.right.equalTo(backView.snp.right).inset(12)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




