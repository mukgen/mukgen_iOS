import UIKit
import MealService
import SnapKit
import Then
import MukgenKit

class MukgenPickCell: UICollectionViewCell {
    
    let apiManager = MukgenPickService()
    
    static let id = "customCell"
    
    var pickText = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.text = "PICK"
        $0.textColor = MukgenKitAsset.Colors.pointBase.color
    }
    
    var gptImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.gpt.image
    }
    
    var tasteGoodText = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "GPT가 골라주는 급식"
        $0.textColor = MukgenKitAsset.Colors.pointBase.color
    }
    
    var todayDate = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.textColor = MukgenKitAsset.Colors.pointBase.color
    }

    public var backView = UIImageView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        $0.layer.cornerRadius = 10.0
        $0.layer.borderWidth = 2
        $0.layer.borderColor = MukgenKitAsset.Colors.pointLight4.color.cgColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(pickText)
        pickText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.left.equalToSuperview().offset(24)
        }
        
        contentView.addSubview(gptImage)
        gptImage.snp.makeConstraints {
            $0.leading.equalTo(pickText.snp.trailing).offset(2)
            $0.top.equalToSuperview().offset(16)
        }
        
        contentView.addSubview(tasteGoodText)
        tasteGoodText.snp.makeConstraints {
            $0.top.equalTo(pickText.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(24)
        }
        
        contentView.addSubview(todayDate)
        todayDate.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalTo(tasteGoodText.snp.right).offset(100)
        }
        
        //이거는 view에 함수를 가져와서 보여주어야하기 때문에 생명주기에 있어야합니다.
        //일단은 에러를 고쳐주기는 했는데 제가 보기에는 cell에 데이터를 파싱하지말고 collectionVIew 자체에서 cellforLowat에서 데이터를 파싱하는 것을 추천합니다.
        apiManager.fetchRiceMenu1 { [weak self] mukgenPickMenuResponse in
            guard let mukgenPickMenuResponse = mukgenPickMenuResponse else {
                print("Error fetching rice menu")
                return
            }
            DispatchQueue.main.async {
                self?.updateUI(with: mukgenPickMenuResponse)
            }
        }
        
    }
    
    private func updateUI(with mukgenPickMenuResponse: MukgenPickMenuResponse) {
        todayDate.text = "\(mukgenPickMenuResponse.month)월 \(mukgenPickMenuResponse.day)일"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
