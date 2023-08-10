import UIKit
import SnapKit
import Then
import MukgenKit
import BoardService

class PopularPostViewCell: UICollectionViewCell {
    
    static let PopularPostViewCellid = "PopularPostViewCell"
    
    let popularPostServiceProvider = PopularPostServiceProvider()
    
    var popularText1 = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "제주도 가고싶다"
        $0.textColor = .black
    }
    
    private var chatImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.chat.image
    }
    
    private var viewImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.eye.image
    }
    
    var chatCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "24"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    var viewCount = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "16"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        $0.layer.cornerRadius = 10.0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(popularText1)
        popularText1.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(16)
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
        
        popularPostServiceProvider.fetchPopularPosts { popularPosts in

            guard let posts = popularPosts else {
                print("인기 게시물을 가져오는 데 실패했습니다.")
                return
            }

            for post in posts {
                print("제목: \(post.title)")
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
