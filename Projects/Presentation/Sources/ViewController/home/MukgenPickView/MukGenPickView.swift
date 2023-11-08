import UIKit
import Then
import SnapKit
import MukgenKit
import MealService

class MukgenPickView: UIView {
    private final var controller: UIViewController
    
    let apiManager = MukgenPickServiceProvider()
    var box: MukgenPickMenuResponse?
    
    private lazy var mukgenPickCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(MukgenPickCell.self, forCellWithReuseIdentifier: MukgenPickCell.id)
        
        return collectionView
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)
        mukgenPickCollectionView.delegate = self
        mukgenPickCollectionView.dataSource = self
        
        layout()
        fetchRiceMenuAndUpdateUI()
        mukgenPickCollectionView.reloadData()
    }
    
    func layout() {
        self.addSubview(mukgenPickCollectionView)
        
        mukgenPickCollectionView.snp.makeConstraints {
            $0.height.equalTo(69.0)
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fetchRiceMenuAndUpdateUI() {
        apiManager.fetchmukgenPick { [weak self] mukgenPickMenuResponse in
            guard let mukgenPickMenuResponse = mukgenPickMenuResponse else {
                print("Error fetching rice menu")
                return
            }
            DispatchQueue.main.async {
                self!.box = mukgenPickMenuResponse
                print("✨ \(mukgenPickMenuResponse) ✨")
                self!.mukgenPickCollectionView.reloadData()
            }
        }
    }
 
}

extension MukgenPickView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 353.0, height: 69.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension MukgenPickView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("asdf")
    }
}

extension MukgenPickView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MukgenPickCell.id, for: indexPath) as! MukgenPickCell
        cell.backView.backgroundColor = MukgenKitAsset.Colors.pointLight4.color
        cell.layer.cornerRadius = 10.0
//        cell.todayDate.text = "\(box?.month)월 \(box?.day)일"
        
        if let box = box {
            cell.todayDate.text = "\(box.month)월 \(box.day)일"
        } else {
            cell.todayDate.text = ""
        }
        return cell
    }
    

}

