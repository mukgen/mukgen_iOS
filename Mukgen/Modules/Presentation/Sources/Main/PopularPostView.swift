import UIKit
import SnapKit
import Then

class PopularPostView: UIView {
    private final var controller: UIViewController
    
    private lazy var popularPostCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .red
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.id)
        
        return collectionView
        
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        popularPostCollectionView.delegate = self
        popularPostCollectionView.dataSource = self
        
        layout()
        popularPostCollectionView.reloadData()
    }
    
    func layout() {
        self.addSubview(popularPostCollectionView)
        
        popularPostCollectionView.snp.makeConstraints {
            $0.height.equalTo(150.0)
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopularPostView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 353.0, height: 49.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension PopularPostView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("sdfsdf")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularPostViewCell.id, for: indexPath) as! PopularPostViewCell
        cell.backView.backgroundColor = PresentationAsset.Colors.primaryLight3.color
        cell.layer.cornerRadius = 10.0
        return cell
    }
}

