import UIKit
import SnapKit
import Then
import MukgenKit

class BoardHotContentsCell: UICollectionViewCell {
    
    static let id = "BoardHotContentsCell"
    
    var boardText = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.text = "제주도 가고싶다"
        $0.textColor = .black
    }
    
    var hotImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.hot.image
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
    }
    
    private var chatImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.chat.image
    }
    
    private var viewImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.eye.image
    }
    
    private var chatCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "5"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    private var viewCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "101"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(hotImage)
        hotImage.snp.makeConstraints {
            $0.width.equalTo(32)
            $0.height.equalTo(14)
            $0.top.equalToSuperview().offset(18.5)
            $0.bottom.equalToSuperview().inset(18.5)
            $0.left.equalToSuperview().offset(24)
        }
        
        contentView.addSubview(boardText)
        boardText.snp.makeConstraints {
            $0.left.equalTo(hotImage.snp.right).offset(6)
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(chatImage)
        chatImage.snp.makeConstraints {
            $0.right.equalToSuperview().inset(100)
            $0.top.equalToSuperview().offset(16.5)
            $0.bottom.equalToSuperview().inset(16.5)
        }
        
        contentView.addSubview(viewImage)
        viewImage.snp.makeConstraints {
            $0.right.equalToSuperview().inset(46)
            $0.top.equalToSuperview().offset(16.5)
            $0.bottom.equalToSuperview().inset(16.5)
        }
        
        contentView.addSubview(chatCount)
        chatCount.snp.makeConstraints {
            $0.left.equalTo(chatImage.snp.right).offset(4)
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }

        contentView.addSubview(viewCount)
        viewCount.snp.makeConstraints {
            $0.left.equalTo(viewImage.snp.right).offset(4)
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


