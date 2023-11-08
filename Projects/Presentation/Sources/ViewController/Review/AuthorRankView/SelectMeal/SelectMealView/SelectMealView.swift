import UIKit
import Then
import SnapKit
import MukgenKit

class SelectMealView: UIView {
    private final var controller: UIViewController
    
    private lazy var selectMealCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(SelectMealCollectionViewCell.self, forCellWithReuseIdentifier: SelectMealCollectionViewCell.id)
        
        return collectionView
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        selectMealCollectionView.delegate = self
        selectMealCollectionView.dataSource = self
        
        layout()
        selectMealCollectionView.reloadData()
    }
    
    func layout() {
        self.addSubview(selectMealCollectionView)
        
        selectMealCollectionView.snp.makeConstraints {
            $0.height.equalTo(626.0)
            $0.top.leading.trailing.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectMealView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 353.0, height: 198.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

extension SelectMealView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("asdf")
    }
}

extension SelectMealView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectMealCollectionViewCell.id, for: indexPath) as! SelectMealCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.riceTypeLabel.text = "아침"
            cell.riceTypeImage.image = MukgenKitAsset.Assets.breakfastImage.image
        case 1:
            cell.riceTypeLabel.text = "점심"
            cell.riceTypeImage.image = MukgenKitAsset.Assets.lunch.image
        case 2:
            cell.riceTypeLabel.text = "저녁"
            cell.riceTypeImage.image = MukgenKitAsset.Assets.night.image
        default:
            break
        }
        cell.riceIdLabel.text = "23.05.08"
        return cell
    }
}

