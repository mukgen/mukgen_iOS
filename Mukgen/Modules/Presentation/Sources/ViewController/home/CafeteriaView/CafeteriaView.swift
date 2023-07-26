import UIKit
import SnapKit
import Then
import MukgenKit
import Core

class CafeteriaView: UIView {
    
    
    private final var controller: UIViewController
    
    private enum Const {
        static let itemSize = CGSize(width: 353, height: 220)
        static let itemSpacing = 24.0
        
        static var insetX: CGFloat {
            (UIScreen.main.bounds.width - Self.itemSize.width) / 2.0
        }
        static var collectionViewContentInset: UIEdgeInsets {
            UIEdgeInsets(top: 36.0, left: Self.insetX, bottom: 0, right: Self.insetX)
        }
    }
    
    private lazy var todayCafeteriaTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.text = "오늘의 급식"
        $0.textColor = .black
    }
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = Const.itemSize
        $0.minimumLineSpacing = Const.itemSpacing
        $0.minimumInteritemSpacing = 0
    }
    
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
        $0.register(CafeteriaCollecionViewCell.self, forCellWithReuseIdentifier: "CafeteriaCollecionViewCell")
        $0.isPagingEnabled = false
        $0.contentInsetAdjustmentBehavior = .never
        $0.contentInset = Const.collectionViewContentInset
        $0.decelerationRate = .fast
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var items = [1,2,3]
    private var previousIndex: Int?
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        layout()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func layout() {
        [
            todayCafeteriaTitle,
            collectionView
        ].forEach { addSubview($0) }

        todayCafeteriaTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(20)
        }

        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(0.0)
            $0.height.equalTo(256)
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CafeteriaView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CafeteriaCollecionViewCell", for: indexPath) as! CafeteriaCollecionViewCell
        cell.layout()
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 10.0
        cell.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color

        if indexPath.row == 1 {
            cell.breakfastImage.image = MukgenKitAsset.Images.lunch.image
            cell.breakfastText.text = "점심"
        }
        if indexPath.row == 2 {
            cell.breakfastImage.image = MukgenKitAsset.Images.night.image
            cell.breakfastText.text = "저녁"
            cell.breakfastMenu1.text = "qkq"
        }
        
        
        
        return cell
    }
}

extension CafeteriaView: UICollectionViewDelegateFlowLayout {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = Const.itemSize.width + Const.itemSpacing
        let index = round(scrolledOffsetX / cellWidth)
        targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrolledOffset = scrollView.contentOffset.x + scrollView.contentInset.left
        let cellWidth = Const.itemSize.width + Const.itemSpacing
        let index = Int(round(scrolledOffset / cellWidth))
        
        defer {
            previousIndex = index
            collectionView.reloadData()
        }
        
        guard
            let previousIndex = previousIndex,
            previousIndex != index
        else { return }
    }
}



