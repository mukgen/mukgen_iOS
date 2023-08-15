import UIKit
import SnapKit
import Then
import Core
import MukgenKit
import MealService

class CafeteriaCollecionViewCell: UICollectionViewCell {
    
    let todayMealAPI = TodayMealServiceProvider()
    
    var breakfastText = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = MukgenKitAsset.Colors.pointBase.color
    }

    var breakfastImage = UIImageView().then {
        $0.image = MukgenKitAsset.Images.breakfastImage.image
    }
    
    var breakfastMenu = UILabel().then {
        $0.numberOfLines = 7
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        let text = "없음"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        
        let attributedString = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.black
        ])
        
        $0.attributedText = attributedString
    }
    
    var lunchMenu = UILabel().then {
        $0.numberOfLines = 7
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        let text = "없음"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        
        let attributedString = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .paragraphStyle: paragraphStyle,
            .foregroundColor: UIColor.black
        ])
        
        $0.attributedText = attributedString
    }
    
    var dinnerMenu = UILabel().then {
        $0.numberOfLines = 7
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        let text = "없음"
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
        contentView.addSubview(breakfastMenu)
        contentView.addSubview(lunchMenu)
        contentView.addSubview(dinnerMenu)
        
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
        
        breakfastMenu.snp.makeConstraints {
            $0.top.equalToSuperview().offset(55.5)
            $0.left.equalTo(breakfastText.snp.right).offset(60.0)
        }
        
        lunchMenu.snp.makeConstraints {
            $0.top.equalToSuperview().offset(55.5)
            $0.left.equalTo(breakfastText.snp.right).offset(60.0)
        }
        
        dinnerMenu.snp.makeConstraints {
            $0.top.equalToSuperview().offset(55.5)
            $0.left.equalTo(breakfastText.snp.right).offset(60.0)
        }
        
        todayMealAPI.fetchTodayMeal { [weak self] (result: Result<[TodayMealResponse], Error>) in
            switch result {
            case .success(let todayMealResponses):
                DispatchQueue.main.async {
                    self?.updateUI(with: todayMealResponses)
                }
            case .failure(let error):
                print("Error fetching rice menu: \(error.localizedDescription)")
            }
        }
    }
    
    private func updateUI(with todayMealResponses: [TodayMealResponse]) {
        guard !todayMealResponses.isEmpty else {
            print("No meal data available")
            return
        }

//        let firstResponse = todayMealResponses[0]
//        breakfastMenu.text = "\(firstResponse.items[0])\n\(firstResponse.items[1])\n\(firstResponse.items[2])\n\(firstResponse.items[3])\n"
//        lunchMenu.text = "\(firstResponse.items[0])\n\(firstResponse.items[1])\n\(firstResponse.items[2])\n\(firstResponse.items[3])\n"
//        dinnerMenu.text = "\(firstResponse.items[0])\n\(firstResponse.items[1])\n\(firstResponse.items[2])\n\(firstResponse.items[3])\n"
//        print("\(firstResponse.items)")
//        print("\(firstResponse.items[0])")
//        print("\(firstResponse.items[1])")
//        print("\(firstResponse.items[2])")
//        print("\(firstResponse.items[3])")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
