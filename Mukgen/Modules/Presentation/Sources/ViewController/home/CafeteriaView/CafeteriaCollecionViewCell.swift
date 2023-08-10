import UIKit
import SnapKit
import Then
import Core
import MukgenKit
import MealService

class CafeteriaCollecionViewCell: UICollectionViewCell {
    
    let todayMealAPI = TodayMealService()
    
    var breakfastText = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = MukgenKitAsset.Colors.pointBase.color
    }

    var breakfastImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.breakfastImage.image
    }
    
    var breakfastMenu1 = UILabel().then {
        $0.numberOfLines = 7
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        let text = "밥/카레소스\n삼겹살국수\n사과주스\n잡곡밥\n구슬아이스크림"

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        
        let attributedString = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.black
        ])
        
        $0.attributedText = attributedString
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(breakfastText)
        contentView.addSubview(breakfastImage)
        contentView.addSubview(breakfastMenu1)
        
        breakfastText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(56.5)
            $0.left.equalToSuperview().offset(60.0)
        }
        
        breakfastImage.snp.makeConstraints {
            $0.width.height.equalTo(64)
            $0.top.equalTo(breakfastText.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(42)
            $0.bottom.equalToSuperview().inset(56.5)
        }
        
        breakfastMenu1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(55.5)
            $0.left.equalTo(breakfastText.snp.right).offset(60.0)
        }
        
        //이거는 view에 함수를 가져와서 보여주어야하기 때문에 생명주기에 있어야합니다.
        //일단은 에러를 고쳐주기는 했는데 제가 보기에는 cell에 데이터를 파싱하지말고 collectionVIew 자체에서 cellforLowat에서 데이터를 파싱하는 것을 추천합니다.
        todayMealAPI.fetchRiceMenu { [weak self] todayMealResponses in
            guard let todayMealResponses = todayMealResponses else {
                print("Error fetching rice menu")
                return
            }
            DispatchQueue.main.async {
                self?.updateUI(with: todayMealResponses)
            }
        }
    }
    
    private func updateUI(with todayMealResponses: [TodayMealResponse]) {
        guard !todayMealResponses.isEmpty else {
            print("No meal data available")
            return
        }

        let firstResponse = todayMealResponses[0]
        breakfastMenu1.text = "\(firstResponse.items)\n"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
