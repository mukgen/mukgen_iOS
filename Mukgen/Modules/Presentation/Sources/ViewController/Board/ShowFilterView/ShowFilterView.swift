import UIKit
import Then
import SnapKit
import MukgenKit

class ShowFilterView: UIView {
    
    private final var controller: UIViewController
    
    private lazy var mealBoardTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .semibold)
        $0.text = "급식 게시판"
        $0.textColor = .black
    }
    
    private var selectedIndex: Int = 0 {
        didSet {
            showFilterCollectionView.reloadItems(at: [IndexPath(row: oldValue, section: 0), IndexPath(row: selectedIndex, section: 0)])
        }
    }
        
    var toggleStates: [Bool] = [true, false, false]

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
    
    func toggleDidTap(_ index: Int) {
        guard index != selectedIndex else { return }

        toggleStates[selectedIndex] = false
        toggleStates[index] = true

        let previousIndex = selectedIndex
        selectedIndex = index

        showFilterCollectionView.reloadItems(at: [
            IndexPath(row: previousIndex, section: 0),
            IndexPath(row: selectedIndex, section: 0)
        ])
    }
    
    func layout() {
        self.addSubview(mealBoardTitle)
        self.addSubview(showFilterCollectionView)
        
        mealBoardTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(42)
            $0.left.equalToSuperview().offset(20)
        }
        
        showFilterCollectionView.snp.makeConstraints {
            $0.top.equalTo(mealBoardTitle.snp.bottom).offset(14.0)
            $0.height.equalTo(35.0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
        let previousIndex = selectedIndex
        selectedIndex = indexPath.row

        collectionView.reloadItems(at: [
            IndexPath(row: previousIndex, section: 0),
            IndexPath(row: selectedIndex, section: 0)
        ])
    }
}

extension ShowFilterView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowFilterCell.id, for: indexPath) as! ShowFilterCell

        cell.filterToggle.setTitleColor(toggleStates[indexPath.row] ? .white : MukgenKitAsset.Colors.primaryLight2.color, for: .normal)
        cell.filterBackView.backgroundColor = toggleStates[indexPath.row] ? MukgenKitAsset.Colors.pointBase.color : .white

        switch indexPath.row {
        case 0:
            cell.filterToggle.setTitle("전체", for: .normal)
        case 1:
            cell.filterToggle.setTitle("일간", for: .normal)
        case 2:
            cell.filterToggle.setTitle("주간", for: .normal)
        default:
            break
        }

        cell.onToggleTap = { [weak self] in
            self?.toggleDidTap(indexPath.row)
        }

        return cell
    }
}
