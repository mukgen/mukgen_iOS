import UIKit
import SnapKit
import Then

class BoardFullContentsCell: UICollectionViewCell {
    
    static let id = "BoardFullContentsCell"
    
    var boardText = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.text = "한라방 주스"
        $0.textColor = .black
    }
    
    var boardContentsText = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.text = "부현수 한라방 쩔더라"
        $0.textColor = .black
    }
    
    var boardWriter = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "유지우"
        $0.textColor = PresentationAsset.Colors.primaryLight1.color
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    private var viewImage = UIImageView().then {
        $0.image = PresentationAsset.Images.eye.image
    }

    
    private var chatImage = UIImageView().then {
        $0.image = PresentationAsset.Images.chat.image
    }
    
    private var HeartImage = UIImageView().then {
        $0.image = PresentationAsset.Images.heart.image
    }
    
    private var heartCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "18"
        $0.textColor = PresentationAsset.Colors.pointLight1.color
    }
    
    private var chatCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "24"
        $0.textColor = PresentationAsset.Colors.primaryLight2.color
    }
    
    private var viewCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "16"
        $0.textColor = PresentationAsset.Colors.primaryLight2.color
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(boardText)
        boardText.snp.makeConstraints {
            $0.left.equalToSuperview().offset(24)
            $0.top.equalToSuperview().offset(24)
        }
        
        contentView.addSubview(boardContentsText)
        boardContentsText.snp.makeConstraints {
            $0.left.equalToSuperview().offset(24)
            $0.top.equalTo(boardText.snp.bottom).offset(6)
        }
        
        contentView.addSubview(boardWriter)
        boardWriter.snp.makeConstraints {
            $0.left.equalToSuperview().offset(24)
            $0.top.equalTo(boardContentsText.snp.bottom).offset(6)
        }
        
        contentView.addSubview(HeartImage)
        HeartImage.snp.makeConstraints {
            $0.left.equalToSuperview().offset(24)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        contentView.addSubview(heartCount)
        heartCount.snp.makeConstraints {
            $0.left.equalTo(HeartImage.snp.right).offset(4)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        contentView.addSubview(chatImage)
        chatImage.snp.makeConstraints {
            $0.left.equalTo(heartCount.snp.right).offset(15)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        contentView.addSubview(chatCount)
        chatCount.snp.makeConstraints {
            $0.left.equalTo(chatImage.snp.right).offset(4)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        contentView.addSubview(viewImage)
        viewImage.snp.makeConstraints {
            $0.left.equalTo(chatCount.snp.right).offset(13)
            $0.bottom.equalToSuperview().inset(24)
        }

        contentView.addSubview(viewCount)
        viewCount.snp.makeConstraints {
            $0.left.equalTo(viewImage.snp.right).offset(4)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



