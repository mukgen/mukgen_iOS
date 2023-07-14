import UIKit
import Then
import SnapKit

class NumberOfPersonPageTitleView: UIView {
    private final var controller: UIViewController
    
    private lazy var NuberOfPersonPageTitleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(NumberOfPersonPageTitleCell.self, forCellWithReuseIdentifier: NumberOfPersonPageTitleCell.id)
        
        return collectionView
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        NuberOfPersonPageTitleCollectionView.delegate = self
        NuberOfPersonPageTitleCollectionView.dataSource = self
        
        layout()
        NuberOfPersonPageTitleCollectionView.reloadData()
    }
    
    func layout() {
        self.addSubview(NuberOfPersonPageTitleCollectionView)
        
        NuberOfPersonPageTitleCollectionView.snp.makeConstraints {
            $0.height.equalTo(58.0)
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NumberOfPersonPageTitleView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 353.0, height: 58.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension NumberOfPersonPageTitleView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("asdf")
    }
}

extension NumberOfPersonPageTitleView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    //cell에 관련된 것을 정의합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberOfPersonPageTitleCell.id, for: indexPath) as! NumberOfPersonPageTitleCell
        cell.backView.backgroundColor = .white
        return cell
    }
}


