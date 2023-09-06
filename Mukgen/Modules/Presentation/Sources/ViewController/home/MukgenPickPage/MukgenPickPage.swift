import UIKit
import SnapKit
import Then
import Core
import MukgenKit

public class MukgenPickPageVC: BaseVC {
    public var factory: ModuleFactoryInterface!

    private var pickUILabel = UILabel().then {
        $0.textColor = MukgenKitAsset.Colors.pointBase.color
        $0.text = "PICK"
        $0.font = .systemFont(ofSize: 40, weight: .semibold)
    }

    private var gptIconUIImageView = UIImageView().then {
        $0.image = MukgenKitAsset.Images.gpt.image
    }

    private var introduceGptUILabel = UILabel().then {
        $0.textColor = MukgenKitAsset.Colors.primaryDark1.color
        $0.text = "GPT가 추천하는 맜있는 급식날"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }

    private var dateUILabel = UILabel().then {
        $0.textColor = .black
        $0.text = "5월 10일"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private lazy var mukgenPickPageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(MukgenPickPageCell.self, forCellWithReuseIdentifier: MukgenPickPageCell.id)
        
        return collectionView
    }()
    
    init(frame: CGRect ,viewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        mukgenPickPageCollectionView.delegate = self
        mukgenPickPageCollectionView.dataSource = self
        layout()
        mukgenPickPageCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layout() {
        [
            pickUILabel,
            gptIconUIImageView,
            introduceGptUILabel,
            dateUILabel,
            mukgenPickPageCollectionView,
        ].forEach { view.addSubview($0) }

        pickUILabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(88.0)
            $0.leading.equalToSuperview().offset(20.0)
        }

        gptIconUIImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(88.0)
            $0.leading.equalTo(pickUILabel.snp.trailing).offset(0.0)
            $0.width.height.equalTo(48.0)
        }

        introduceGptUILabel.snp.makeConstraints {
            $0.top.equalTo(pickUILabel.snp.bottom).offset(0.0)
            $0.leading.equalToSuperview().offset(20.0)
        }

        dateUILabel.snp.makeConstraints {
            $0.top.equalTo(introduceGptUILabel.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().offset(20.0)
        }

        mukgenPickPageCollectionView.snp.makeConstraints {
            $0.top.equalTo(dateUILabel.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().offset(20.0)
            $0.trailing.equalToSuperview().offset(-20.0)
        }
    }

    public override func attribute() {
        view.backgroundColor = .white
    }

}

extension MukgenPickPageVC: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 353.0, height: 69.0)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension MukgenPickPageVC: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MukgenPickPageCell.id, for: indexPath) as! MukgenPickPageCell
        cell.backView.backgroundColor = MukgenKitAsset.Colors.pointLight4.color
        cell.layer.cornerRadius = 10.0

        return cell
    }
}
