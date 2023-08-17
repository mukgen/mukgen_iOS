import UIKit
import SnapKit
import Then
import MukgenKit

class MyPostCollectionViewCell: UICollectionViewCell {
    
    static let id = "MyPostCollectionViewCell"
    
    public var backView1 = UIImageView().then {
        $0.backgroundColor = .clear
    }
    
    public var imageBackView = UIImageView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        $0.layer.cornerRadius = 30
    }
    
    var myPostImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.myPostStar.image
    }
    
    var myPostText = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "내 리뷰"
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView1)
        backView1.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(imageBackView)
        imageBackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(0)
            $0.width.height.equalTo(60)
        }
        
        imageBackView.addSubview(myPostImage)
        myPostImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(imageBackView)
            $0.width.height.equalTo(24)
        }
        
        contentView.addSubview(myPostText)
        myPostText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageBackView.snp.bottom).offset(6)
            $0.height.equalTo(14)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
