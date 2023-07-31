import UIKit
import SnapKit
import Then
import MukgenKit
import Core

class MoreReviewViewController: UIViewController {
    
    var dateLabel = UILabel().then {
        $0.text = "2023-05-08"
        $0.textColor = MukgenKitAsset.Colors.primaryBase.color
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
    }
    
    var blackButton = UIButton().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 8
        $0.setTitleColor(.white, for: .normal)
    }

    private lazy var todayCafeteriaReviewCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(TodayReviewCell.self, forCellWithReuseIdentifier: TodayReviewCell.TodayReviewCell)
        
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        todayCafeteriaReviewCollectionView.delegate = self
        todayCafeteriaReviewCollectionView.dataSource = self
        todayCafeteriaReviewCollectionView.reloadData()
        title = "급식"
        
        layout()
    }
    
    func layout() {
        [
            dateLabel,
            blackButton,
            todayCafeteriaReviewCollectionView
        ].forEach { view.addSubview($0) }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(20.0)
        }
        
        blackButton.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.top)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(8.0)
            $0.height.width.equalTo(24.0)
        }
        
        todayCafeteriaReviewCollectionView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(13.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension MoreReviewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 353.0, height: 92.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}

extension MoreReviewViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("sdfsdf")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayReviewCell.TodayReviewCell, for: indexPath) as! TodayReviewCell
        cell.backView.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        cell.layer.cornerRadius = 10.0
        return cell
    }
}

