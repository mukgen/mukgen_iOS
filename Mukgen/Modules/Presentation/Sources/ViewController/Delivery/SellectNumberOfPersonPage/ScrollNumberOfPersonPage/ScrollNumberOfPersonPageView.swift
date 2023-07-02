import UIKit
import Then
import SnapKit

class ScrollNumberOfPersonPageView: UIView {
    public var widthCell = 353.0
    public var heightCell = 56.0
    
    private final var controller: UIViewController

    private lazy var BoardContentsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.decelerationRate = .fast
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ScrollNumberOfPersonPageCell.self, forCellWithReuseIdentifier: ScrollNumberOfPersonPageCell.id)
        return collectionView
    }()
    
    public var selectNumberBox = UIImageView().then {
        $0.layer.cornerRadius = 8.0
        $0.backgroundColor = PresentationAsset.Colors.primaryLight3.color
    }
    
    public var selectNumberBoxBackView = UIImageView().then {
        $0.backgroundColor = .clear
    }
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        BoardContentsCollectionView.delegate = self
        BoardContentsCollectionView.dataSource = self
        
        layout()
        BoardContentsCollectionView.reloadData()
    }
    
    func layout() {
//        self.addSubview(selectNumberBoxBackView)
        self.addSubview(selectNumberBox)
        self.addSubview(BoardContentsCollectionView)
        
        
        BoardContentsCollectionView.snp.makeConstraints {
            $0.height.equalTo(240.0)
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        selectNumberBox.snp.makeConstraints {
            $0.width.equalTo(353.0)
            $0.height.equalTo(56.0)
            $0.top.equalTo(BoardContentsCollectionView.snp.top).offset(92.0)
            $0.left.equalTo(BoardContentsCollectionView.snp.left).offset(20.0)
        }
        
//        selectNumberBoxBackView.snp.makeConstraints {
//            $0.width.equalTo(353.0)
//            $0.height.equalTo(240.0)
//            $0.top.leading.trailing.bottom.equalToSuperview()
//        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScrollNumberOfPersonPageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            widthCell = 353.0
            heightCell = 56.0
        return CGSize(width: widthCell, height: heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ScrollNumberOfPersonPageView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("asdf")
    }
}

extension ScrollNumberOfPersonPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    //cell에 관련된 것을 정의합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hotCell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollNumberOfPersonPageCell.id, for: indexPath) as! ScrollNumberOfPersonPageCell
        hotCell.backView.backgroundColor = .clear
        
        switch indexPath.row {
        case 0 :
            hotCell.boardText.text = ""
            return hotCell
        case 1 :
            hotCell.boardText.text = ""
            return hotCell
        case 2 :
            hotCell.boardText.text = "1"
            return hotCell
        case 3 :
            hotCell.boardText.text = "2"
            return hotCell
        case 4 :
            hotCell.boardText.text = "3"
            return hotCell
        case 5 :
            hotCell.boardText.text = "4"
            return hotCell
        case 6 :
            hotCell.boardText.text = "5"
            return hotCell
        case 7 :
            hotCell.boardText.text = "6"
            return hotCell
        case 8 :
            hotCell.boardText.text = "7"
            return hotCell
        case 9 :
            hotCell.boardText.text = "8"
            return hotCell
        case 10 :
            hotCell.boardText.text = "9"
            return hotCell
        default:
            hotCell.boardText.text = ""
            return hotCell
        }
    }
    
}
