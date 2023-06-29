import UIKit
import Then
import SnapKit

class TendinousView: UIView {
    
    private final var controller: UIViewController

    private lazy var TendinousCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.register(TendinousCell.self, forCellWithReuseIdentifier: TendinousCell.id)
        return collectionView
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        TendinousCollectionView.delegate = self
        TendinousCollectionView.dataSource = self
        
        layout()
        TendinousCollectionView.reloadData()
    }
    
    public var plusButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.backgroundColor = PresentationAsset.Colors.pointBase.color
        $0.layer.cornerRadius = 30
    }
    
    func layout() {
        self.addSubview(TendinousCollectionView)
        self.addSubview(plusButton)
        
        TendinousCollectionView.snp.makeConstraints {
            $0.height.equalTo(640.0)
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.bottom.equalToSuperview().inset(20.0)
            $0.right.equalToSuperview().inset(20.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TendinousView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 171.5, height: 140.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension TendinousView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("asdf")
    }
}

extension TendinousView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    //cell에 관련된 것을 정의합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tendinousCell = collectionView.dequeueReusableCell(withReuseIdentifier: TendinousCell.id, for: indexPath) as! TendinousCell
        tendinousCell.backView.layer.cornerRadius = 15.13
        tendinousCell.backView.backgroundColor = PresentationAsset.Colors.pointLight4.color
        if indexPath.row == 0 {
            tendinousCell.checkImage.image = PresentationAsset.Images.checked.image
            return tendinousCell
        }
        
        return tendinousCell
    }
}
