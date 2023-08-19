import UIKit
import Then
import SnapKit
import MukgenKit

class MyPostView: UIView {
    private final var controller: UIViewController
    
    let collectionLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    private lazy var myPostCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout).then {
    
        $0.isPagingEnabled = false
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        
        $0.register(MyPostCollectionViewCell.self, forCellWithReuseIdentifier: MyPostCollectionViewCell.id)
        
        $0.delegate = self
        $0.dataSource = self
    }
    
    init(frame: CGRect,viewController:UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        
        layout()
        myPostCollectionView.reloadData()
    }
    
    func layout() {
        self.addSubview(myPostCollectionView)
        
        myPostCollectionView.snp.makeConstraints {
            $0.height.equalTo(100.0)
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPostView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 60.0, height: 80.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 31
    }
}

extension MyPostView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("asdf")
    }
}

extension MyPostView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPostCollectionViewCell.id, for: indexPath) as! MyPostCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.myPostImage.image = MukgenKitAsset.Images.myPostStar.image
            cell.myPostText.text = "내 리뷰"
            return cell
            
        case 1:
            cell.myPostImage.image = MukgenKitAsset.Images.myPostBoard.image
            cell.myPostText.text = "내 게시글"
            return cell
            
        case 2:
            cell.myPostImage.image = MukgenKitAsset.Images.myPostSuggestion.image
            cell.myPostText.text = "내 급식 건의"
            return cell
            
        case 3:
            cell.myPostImage.image = MukgenKitAsset.Images.myPostDelivery.image
            cell.myPostText.text = "내 배달 파티"
            return cell
        default:
            break
        }
        return cell
    }
    

}
