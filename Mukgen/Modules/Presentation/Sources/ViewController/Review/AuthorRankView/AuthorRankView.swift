
import UIKit
import SnapKit
import Then

struct Author {
    let rank: Int
    let imageUrl: String
    let name: String
    let systemImage: String
    let detail1: String
    let detail2: String
}

class AuthorRankView: UIView {
    
    private final var controller: UIViewController
    
    private let mainTitle = UILabel().then {
        $0.text = "Author Ranking"
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 16)
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AuthorRankCell.self, forCellWithReuseIdentifier: "AuthorRankCell")
        return collectionView
    }()

    init(controller: UIViewController) {
        self.controller = controller
        super.init(frame: .zero)
        layout()
        self.backgroundColor = .red
    }

    func layout() {
        [
            mainTitle,
            collectionView
        ].forEach { addSubview($0) }
        
        mainTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(mainTitle.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
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
            Author(rank: 1, imageUrl: "image1", name: "Author 1", systemImage: "system1", detail1: "Detail1-1", detail2: "Detail1-2"),
            Author(rank: 2, imageUrl: "image2", name: "Author 2", systemImage: "system2", detail1: "Detail2-1", detail2: "Detail2-2"),
            Author(rank: 3, imageUrl: "image3", name: "Author 3", systemImage: "system3", detail1: "Detail3-1", detail2: "Detail3-2")
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
        return CGSize(width: collectionView.frame.width * 0.8, height: collectionView.frame.height)
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
        rankLabel.font = UIFont.boldSystemFont(ofSize: 20)
        rankLabel.textColor = .black
        rankLabel.textAlignment = .center
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        
        systemImageView.tintColor = .lightGray
        
        detailLabel1.font = UIFont.systemFont(ofSize: 14)
        detailLabel1.textColor = .lightGray
        detailLabel1.textAlignment = .left
        
        detailLabel2.font = UIFont.systemFont(ofSize: 14)
        detailLabel2.textColor = .lightGray
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
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(imageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        systemImageView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(32)
        }
        
        detailLabel1.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(16)
            $0.leading.equalTo(systemImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        detailLabel2.snp.makeConstraints {
            $0.top.equalTo(detailLabel1.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(detailLabel1)
        }
    }
}

extension AuthorRankCell {
    func configure(with author: Author) {
        rankLabel.text = "\(author.rank)"
        imageView.image = UIImage(named: author.imageUrl) // Replace with the proper way to load the image
        nameLabel.text = author.name
        systemImageView.image = UIImage(systemName: author.systemImage) // Replace with the correct system image
        detailLabel1.text = author.detail1
        detailLabel2.text = author.detail2
    }
}
