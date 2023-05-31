import UIKit
import SnapKit
import Then
import Core
import MukgenKit

class CafeteriaCollecionViewCell: UICollectionViewCell {
    
    var breakfastText = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.text = "아침"
        $0.textColor = PresentationAsset.Colors.pointBase.color
    }

    var breakfastImage = UIImageView().then {
        $0.image = UIImage(named: "breakfastImage")
    }
    
    var breakfastMenu1 = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "밥/카레소스"
        $0.textColor = .black
    }
    
    var breakfastMenu2 = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "삼겹살국수"
        $0.textColor = .black
    }
    
    var breakfastMenu3 = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "사과주스"
        $0.textColor = .black
    }
    
    var breakfastMenu4 = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "잡곡밥"
        $0.textColor = .black
    }
    
    var breakfastMenu5 = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.text = "구슬아이스크림"
        $0.textColor = .black
    }
    
    func layout() {
        contentView.addSubview(breakfastText)
        contentView.addSubview(breakfastImage)
        contentView.addSubview(breakfastMenu1)
        contentView.addSubview(breakfastMenu2)
        contentView.addSubview(breakfastMenu3)
        contentView.addSubview(breakfastMenu4)
        contentView.addSubview(breakfastMenu5)
        
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
        
        breakfastMenu2.snp.makeConstraints {
            $0.top.equalTo(breakfastMenu1.snp.bottom).offset(6.0)
            $0.left.equalTo(breakfastText.snp.right).offset(60.0)
        }
        
        breakfastMenu3.snp.makeConstraints {
            $0.top.equalTo(breakfastMenu2.snp.bottom).offset(6.0)
            $0.left.equalTo(breakfastText.snp.right).offset(60.0)
        }
        
        breakfastMenu4.snp.makeConstraints {
            $0.top.equalTo(breakfastMenu3.snp.bottom).offset(6.0)
            $0.left.equalTo(breakfastText.snp.right).offset(60.0)
        }
        
        breakfastMenu5.snp.makeConstraints {
            $0.top.equalTo(breakfastMenu4.snp.bottom).offset(6.0)
            $0.left.equalTo(breakfastText.snp.right).offset(60.0)
        }
        
        
    }
}
