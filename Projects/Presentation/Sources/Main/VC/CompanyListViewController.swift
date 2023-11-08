import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import Core
import INFOKit
import INetwork

public class CompanyListViewController: UIViewController {
    
    private lazy var advertisementView = AdvertisementView(frame: .zero, viewController: self, mainTitleText: "이번 년도에는 총 100개의\n회사와 MOU를 맺었어요", subTitleText: "DSM의 회사 목록을 확인해보세요!  - 2022.12.30 기준").then {
        $0.layer.cornerRadius = 8.97
        $0.backgroundColor = INFOKitAsset.Colors.mainColor.color
    }
    
    private let searchBar = InfoSearchBar().then {
        $0.layer.cornerRadius = 23.13
        $0.customPlaceholder = "검색어를 입력해주세요. (ex. 회사, 직군 등)"
        $0.placeholderFont = UIFont.systemFont(ofSize: 10.0, weight: .medium)
        $0.placeholderFontSize = 10.0
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
        layout()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: InfoCollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 20, right: 30)
    }
    
    func layout() {
        
        view.addSubview(advertisementView)
        
        advertisementView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(370.0)
            $0.height.equalTo(130.0)
        }
        
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(advertisementView.snp.bottom).offset(30)
            $0.height.equalTo(44.0)
        }

        view.addSubview(collectionView)

        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(20.0)
            $0.trailing.leading.bottom.equalToSuperview()
        }
    }
}


extension CompanyListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCollectionViewCell.id, for: indexPath) as? InfoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.layout()
        cell.layer.cornerRadius = 9.25
        
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 60, height: 110)
    }
}
