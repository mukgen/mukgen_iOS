import UIKit
import SnapKit
import Then
import MukgenKit

class DeliveryContentsCell: UICollectionViewCell {
    
    static let id = "DeliveryContentsCell"
    
    var writer = UILabel().then {
        $0.font = .systemFont(ofSize: 14.12, weight: .semibold)
        $0.text = "이은호"
        $0.textColor = .black
    }
    
    var contents = UILabel().then {
        $0.font = .systemFont(ofSize: 12.11, weight: .regular)
        $0.text = "제주한라봉"
        $0.textColor = .black
    }
    
    var contentsTime = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "제주도 | 오후 06:00"
        $0.textColor = MukgenKitAsset.Colors.primaryLight1.color
    }
    
    var countPeople = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "7 / 8"
        $0.textColor = MukgenKitAsset.Colors.primaryDark1.color
    }
    
    var perticipatePerson1 = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "이은호"
        $0.textColor = MukgenKitAsset.Colors.primaryDark1.color
    }
    
    var perticipatePerson2 = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "햄스터"
        $0.textColor = MukgenKitAsset.Colors.primaryDark1.color
    }

    var perticipatePerson3 = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "이태영"
        $0.textColor = MukgenKitAsset.Colors.primaryDark1.color
    }
    
    public var perticipateIn = UIButton().then {
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.setTitle("참여하기", for: .normal)
        $0.tintColor = .white
        $0.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        $0.layer.cornerRadius = 10.0
    }
    
    public var profileImage = UIImageView().then {
        $0.image = MukgenKitAsset.Assets.testProfile1.image
    }
    
    public var profileImage1 = UIImageView().then {
        $0.image = MukgenKitAsset.Assets.testProfile1.image
    }
    
    public var profileImage2 = UIImageView().then {
        $0.image = MukgenKitAsset.Assets.testProfile2.image
    }
    
    public var profileImage3 = UIImageView().then {
        $0.image = MukgenKitAsset.Assets.testProfile1.image
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
    
    public var smallbackView = UIImageView().then {
        $0.backgroundColor = .none
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
            $0.left.equalTo(backView.snp.left).offset(91.0)
            $0.top.equalToSuperview().offset(18.0)
        }
        
        contentView.addSubview(contents)
        contents.snp.makeConstraints {
            $0.left.equalTo(backView.snp.left).offset(91.0)
            $0.top.equalTo(writer.snp.bottom).offset(4.0)
        }
        
        contentView.addSubview(contentsTime)
        contentsTime.snp.makeConstraints {
            $0.left.equalTo(backView.snp.left).offset(91.0)
            $0.top.equalTo(contents.snp.bottom).offset(4.0)
        }
        
        contentView.addSubview(countPeople)
        countPeople.snp.makeConstraints {
            $0.right.equalTo(backView.snp.right).inset(15.0)
            $0.top.equalTo(backView.snp.top).offset(20.0)
        }
        
        contentView.addSubview(profileImage)
        profileImage.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(15)
            $0.left.equalTo(backView.snp.left).offset(16)
          
        }
        
        contentView.addSubview(profileImage1)
        profileImage1.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).inset(90)
            $0.left.equalTo(backView.snp.left).offset(13)
        }
        
        contentView.addSubview(profileImage2)
        profileImage2.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(90)
            $0.left.equalTo(profileImage1.snp.right).offset(12)
        }
    
        contentView.addSubview(profileImage3)
        profileImage3.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(90)
            $0.left.equalTo(profileImage2.snp.right).offset(12)
        }
        
        contentView.addSubview(perticipatePerson1)
        perticipatePerson1.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(122)
            $0.left.equalTo(backView.snp.left).offset(12)
        }
        
        contentView.addSubview(perticipatePerson2)
        perticipatePerson2.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(122)
            $0.left.equalTo(perticipatePerson1.snp.right).offset(10)
        }
        
        contentView.addSubview(perticipatePerson3)
        perticipatePerson3.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(122)
            $0.left.equalTo(perticipatePerson2.snp.right).offset(10)
        }
        
        contentView.addSubview(perticipateIn)
        perticipateIn.snp.makeConstraints {
            $0.width.equalTo(333.0)
            $0.height.equalTo(39.0)
            $0.bottom.equalTo(backView.snp.bottom).inset(10.0)
            $0.left.equalTo(backView.snp.left).offset(10.0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




