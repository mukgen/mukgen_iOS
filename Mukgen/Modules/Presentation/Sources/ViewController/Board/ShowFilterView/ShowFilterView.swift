import UIKit
import Then
import SnapKit
import MukgenKit

class ShowFilterView: UIView {
    
    private final var controller: UIViewController
    
    private lazy var showFilterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(ShowFilterCell.self, forCellWithReuseIdentifier: ShowFilterCell.id)
        
        return collectionView
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        showFilterCollectionView.delegate = self
        showFilterCollectionView.dataSource = self
        
        layout()
        showFilterCollectionView.reloadData()
    }
    
    func layout() {
        self.addSubview(showFilterCollectionView)
        
        showFilterCollectionView.snp.makeConstraints {
            $0.height.equalTo(35.0)
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func toggleDidTap(_ sender: Any) {
//
//    }
}

extension ShowFilterView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 60.0, height: 35.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension ShowFilterView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ShowFilterView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    //cell에 관련된 것을 정의합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowFilterCell.id, for: indexPath) as! ShowFilterCell
        cell.filterBackView.backgroundColor = .white
        cell.filterBackView.layer.borderWidth = 1
        cell.filterBackView.layer.borderColor = MukgenKitAsset.Colors.primaryLight2.color.cgColor
        cell.filterBackView.layer.cornerRadius = 17.5
        
        switch indexPath.row {
        case 0:
            break
        case 1 :
            cell.filterToggle.setTitle("일간", for: .normal)
        default:
            cell.filterToggle.setTitle("주간", for: .normal)
        }
        return cell
    }
}


