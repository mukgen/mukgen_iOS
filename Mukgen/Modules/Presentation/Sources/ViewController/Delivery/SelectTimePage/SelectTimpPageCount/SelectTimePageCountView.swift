import UIKit
import Then
import SnapKit

class SelectTimePageCountView: UIView {
    private final var controller: UIViewController
    
    private lazy var SelectTimePageCountCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(SelectTimePageCountCell.self, forCellWithReuseIdentifier: SelectTimePageCountCell.id)

        return collectionView
    }()

    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        SelectTimePageCountCollectionView.delegate = self
        SelectTimePageCountCollectionView.dataSource = self

        layout()
        SelectTimePageCountCollectionView.reloadData()
    }

    func layout() {
        self.addSubview(SelectTimePageCountCollectionView)

        SelectTimePageCountCollectionView.snp.makeConstraints {
            $0.height.equalTo(24.0)
            $0.top.leading.trailing.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SelectTimePageCountView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 353.0, height: 24.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension SelectTimePageCountView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    //cell에 관련된 것을 정의합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectTimePageCountCell.id, for: indexPath) as! SelectTimePageCountCell
        cell.backView.backgroundColor = .white
        return cell
    }
}
