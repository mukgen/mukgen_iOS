import UIKit
import Then
import SnapKit

    public class DeliveryContentsView: UIView {
        
        var bigHeight = -1
        var width = 353.0
        var height = 90.0
    
    
    private final var controller: UIViewController

    private lazy var deliveryContentsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.register(DeliveryContentsCell.self, forCellWithReuseIdentifier: DeliveryContentsCell.id)
        return collectionView
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        deliveryContentsCollectionView.delegate = self
        deliveryContentsCollectionView.dataSource = self
        
        layout()
        deliveryContentsCollectionView.reloadData()
    }
    
    public var plusButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.backgroundColor = PresentationAsset.Colors.pointBase.color
        $0.layer.cornerRadius = 30
    }
    
    func layout() {
        self.addSubview(deliveryContentsCollectionView)
        self.addSubview(plusButton)
        
        deliveryContentsCollectionView.snp.makeConstraints {
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

extension DeliveryContentsView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if bigHeight == indexPath.row {
            return CGSize(width: 353.0, height: 191)
        }
        else
        {
            return CGSize(width: 353.0, height: 90)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension DeliveryContentsView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        bigHeight = indexPath.row
        collectionView.reloadData()
    }
}

extension DeliveryContentsView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    //cell에 관련된 것을 정의합니다.
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let deliveryContentsCell = collectionView.dequeueReusableCell(withReuseIdentifier: DeliveryContentsCell.id, for: indexPath) as! DeliveryContentsCell
        if bigHeight == indexPath.row {
            deliveryContentsCell.profileImage1.image = PresentationAsset.Images.testProfile1.image
            deliveryContentsCell.profileImage2.image = PresentationAsset.Images.testProfile2.image
            deliveryContentsCell.profileImage3.image = PresentationAsset.Images.testProfile3.image
            deliveryContentsCell.perticipatePerson1.text = "이은호"
            deliveryContentsCell.perticipatePerson2.text = "햄스터"
            deliveryContentsCell.perticipatePerson3.text = "이태영"
            deliveryContentsCell.writer.textColor = PresentationAsset.Colors.primaryBase.color
            deliveryContentsCell.contents.textColor = .black
            deliveryContentsCell.contents.font = .systemFont(ofSize: 14.0, weight: .semibold)
            deliveryContentsCell.perticipateIn.isHidden = false
        }
        else {
            deliveryContentsCell.profileImage1.image = nil
            deliveryContentsCell.profileImage2.image = nil
            deliveryContentsCell.profileImage3.image = nil
            deliveryContentsCell.perticipatePerson1.text = nil
            deliveryContentsCell.perticipatePerson2.text = nil
            deliveryContentsCell.perticipatePerson3.text = nil
            deliveryContentsCell.perticipateIn.isHidden = true
            deliveryContentsCell.writer.textColor = .black
            deliveryContentsCell.contents.textColor = .black
            deliveryContentsCell.contents.font = .systemFont(ofSize: 14.0, weight: .regular)
        }
        deliveryContentsCell.backView.backgroundColor = PresentationAsset.Colors.primaryLight3.color
        deliveryContentsCell.backView.layer.cornerRadius = 10.0
        return deliveryContentsCell
    }
}
