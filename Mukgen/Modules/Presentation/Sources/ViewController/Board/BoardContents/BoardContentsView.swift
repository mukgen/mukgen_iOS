import UIKit
import Then
import SnapKit

class BoardContentsView: UIView {
    public var widthCell = 353.0
    public var heightCell = 51.0
    
    private final var controller: UIViewController
    
    private lazy var BoardContentsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = true
        collectionView.register(BoardContentsCell.self, forCellWithReuseIdentifier: BoardContentsCell.id)
        
        return collectionView
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        BoardContentsCollectionView.delegate = self
        BoardContentsCollectionView.dataSource = self
        
        layout()
        BoardContentsCollectionView.reloadData()
    }
    
    func layout() {
        self.addSubview(BoardContentsCollectionView)
        
        BoardContentsCollectionView.snp.makeConstraints {
            $0.height.equalTo(1000.0)
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BoardContentsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: widthCell, height: heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension BoardContentsView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("asdf")
    }
}

extension BoardContentsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    //cell에 관련된 것을 정의합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardContentsCell.id, for: indexPath) as! BoardContentsCell
        cell.backView.backgroundColor = PresentationAsset.Colors.primaryLight3.color
        cell.backView.layer.cornerRadius = 10
        
        switch indexPath.row
        {
        case 0:
            cell.hotImage.image = PresentationAsset.Images.hot.image
            cell.boardText.text = "제주도 가고싶다"
            heightCell = 51.0
            return cell
            
        case 1:
            cell.hotImage.image = PresentationAsset.Images.hot.image
            cell.boardText.text = "이거 뭐쓸지 고민함"
            heightCell = 51.0
            return cell
        case 2:
            cell.hotImage.image = PresentationAsset.Images.hot.image
            cell.boardText.text = "이은호는 잘생김"
            heightCell = 51.0
            return cell
            
        default:
            cell.hotImage.image = nil
            cell.boardText.text = "이태영은 잼민이"
            heightCell = 144.0
            return cell
        }
        
    }
}
