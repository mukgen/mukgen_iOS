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
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.register(BoardHotContentsCell.self, forCellWithReuseIdentifier: BoardHotContentsCell.id)
        collectionView.register(BoardFullContentsCell.self, forCellWithReuseIdentifier: BoardFullContentsCell.id)
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
    
    public var plusButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.backgroundColor = PresentationAsset.Colors.pointBase.color
        $0.layer.cornerRadius = 30
        $0.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    func layout() {
        self.addSubview(BoardContentsCollectionView)
        self.addSubview(plusButton)
        
        BoardContentsCollectionView.snp.makeConstraints {
            $0.height.equalTo(533.0)
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
    
    @objc func plusButtonTapped(_ sender: UIButton) {
        
//           var responder: UIResponder? = self
//           while responder != nil {
//               responder = responder?.next
//               if let viewController = responder as? UIViewController {
//                   let newViewController = NewMealPostViewController()
//                   viewController.navigationController?.pushViewController(NewMealPostViewController(), animated: true)
//                   break
//               }
//           }
       }
}

extension BoardContentsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row
        {
        case 0, 1, 2:
            widthCell = 353.0
            heightCell = 51.0
        default:
            widthCell = 353.0
            heightCell = 144.0
        }
        return CGSize(width: widthCell, height: heightCell)
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
        return 20
    }

    //cell에 관련된 것을 정의합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hotCell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardHotContentsCell.id, for: indexPath) as! BoardHotContentsCell
        let fullCell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardFullContentsCell.id, for: indexPath) as! BoardFullContentsCell
        hotCell.backView.backgroundColor = PresentationAsset.Colors.primaryLight3.color
        fullCell.backView.backgroundColor = PresentationAsset.Colors.primaryLight3.color
        hotCell.backView.layer.cornerRadius = 10.0
        fullCell.backView.layer.cornerRadius = 10.0

        
        switch indexPath.row
        {
        case 0, 1, 2:
            hotCell.hotImage.image = PresentationAsset.Images.hot.image
            hotCell.boardText.text = "제주도 가고싶다"
            return hotCell
        case 3:
            fullCell.boardText.text = "무슨 노래 듣고 계세요"
            fullCell.boardContentsText.text = "오늘 급식 맛도리"
            fullCell.boardWriter.text = "이은호"
            fullCell.heartCount.text = "7"
            fullCell.chatCount.text = "13"
            fullCell.viewCount.text = "107"
            return fullCell
        default:
            fullCell.boardText.text = "이태영은 잼민이"
            fullCell.boardContentsText.text = "부현수 한라방 쩔더라"
            fullCell.boardWriter.text = "유지우"
            fullCell.heartCount.text = "1"
            fullCell.chatCount.text = "2"
            fullCell.viewCount.text = "3"

            return fullCell
        }
        
    }
}
