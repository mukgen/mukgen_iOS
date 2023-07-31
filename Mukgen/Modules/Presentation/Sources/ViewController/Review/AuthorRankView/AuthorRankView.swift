import UIKit
import SnapKit
import Then
import MukgenKit
import Core

struct Author {
    let rank: Int
    let imageUrl: String
    let name: String
    let systemImage: UIImage
    let detail1: String
    let detail2: String
}

class AuthorRankView: UIView {
    
    private final var controller: UIViewController
    
    private let mainTitle = UILabel().then {
        $0.text = "리뷰 작성자 순위"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.cornerRadius = 10.0
        collectionView.register(AuthorRankCell.self, forCellWithReuseIdentifier: "AuthorRankCell")
        return collectionView
    }()

    init(controller: UIViewController) {
        self.controller = controller
        super.init(frame: .zero)
        layout()
        self.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
    }

    func layout() {
        [
            mainTitle,
            collectionView
        ].forEach { addSubview($0) }
        
        mainTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(mainTitle.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(4)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Dummy Data
extension AuthorRankView {
    private var authors: [Author] {
        [
            Author(rank: 1, imageUrl: "image1", name: "이태영", systemImage: MukgenKitAsset.Images.starImage.image, detail1: "5.0", detail2: " | 리뷰 99개"),
            Author(rank: 2, imageUrl: "image2", name: "햄스터", systemImage: MukgenKitAsset.Images.starImage.image, detail1: "5.0", detail2: " | 리뷰 99개"),
            Author(rank: 3, imageUrl: "image3", name: "ㄱㅇㅇ", systemImage:MukgenKitAsset.Images.starImage.image, detail1: "5.0", detail2: " | 리뷰 99개")
        ]
    }
}

extension AuthorRankView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return authors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthorRankCell", for: indexPath) as! AuthorRankCell
        
        let author = authors[indexPath.item]
        cell.configure(with: author)
        cell.setupCell()
        return cell
    }
}

extension AuthorRankView: UICollectionViewDelegate {}

extension AuthorRankView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 143)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
//    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            let collectionViewWidth = collectionView.bounds.width
            let totalCellWidth = 100 * authors.count
            let totalSpacingWidth = 10 * (authors.count - 1)
            
            let leftInset = (collectionViewWidth - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset
            
            return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}

class AuthorRankCell: UICollectionViewCell {
    
    let rankLabel = UILabel()
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let systemImageView = UIImageView()
    let detailLabel1 = UILabel()
    let detailLabel2 = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell() {
        rankLabel.font = .systemFont(ofSize: 16.0, weight: .bold)
        rankLabel.textColor = .black
        rankLabel.textAlignment = .center
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        
        systemImageView.tintColor = .lightGray
        
        detailLabel1.font = UIFont.systemFont(ofSize: 12)
        detailLabel1.textColor = MukgenKitAsset.Colors.primaryLight2.color
        detailLabel1.textAlignment = .left
        
        detailLabel2.font = UIFont.systemFont(ofSize: 12)
        detailLabel2.textColor = MukgenKitAsset.Colors.primaryLight2.color
        detailLabel2.textAlignment = .left
    }

    func setupLayout() {
        [
            rankLabel,
            imageView,
            nameLabel,
            systemImageView,
            detailLabel1,
            detailLabel2
        ].forEach { addSubview($0) }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.width.equalTo(70.0)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        systemImageView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        detailLabel1.snp.makeConstraints {
            $0.centerY.equalTo(systemImageView)
            $0.leading.equalTo(systemImageView.snp.trailing)
        }
        
        detailLabel2.snp.makeConstraints {
            $0.centerY.equalTo(systemImageView)
            $0.leading.equalTo(detailLabel1.snp.trailing)
//            $0.trailing.lessThanOrEqualToSuperview()
        }
    }

}

extension AuthorRankCell {
    func configure(with author: Author) {
        rankLabel.text = "\(author.rank)"
        imageView.image = UIImage(named: author.imageUrl) // Replace with the proper way to load the image
        nameLabel.text = author.name
        systemImageView.image = author.systemImage
        detailLabel1.text = author.detail1
        detailLabel2.text = author.detail2
    }
}
