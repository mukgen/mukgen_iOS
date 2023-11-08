import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import Core
import INFOKit
import INetwork

class InfoCollectionViewCell: UICollectionViewCell {
    
    static var id: String = "InfoCollectionViewCell"
    
    private var imageView = UIImageView().then {
        $0.image = INFOKitAsset.Assets.defaultImg.image
    }
    
    private var mainTitle = UILabel().then {
        $0.text = "(주)순양 물산"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15.0, weight: .bold)
    }
    
    private var subTitle = UITextView().then {
        $0.text = "운송업을 주 사업으로 활동하는 회사 입니다."
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10.0, weight: .medium)
        $0.isEditable = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        applyShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.backgroundColor = .white
        
        contentView.addSubview(imageView)
        contentView.addSubview(mainTitle)
        contentView.addSubview(subTitle)
        
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(86.0)
            $0.leading.equalToSuperview().offset(14.0)
        }
        
        mainTitle.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top)
            $0.leading.equalTo(imageView.snp.trailing).offset(14.0)
        }
        
        subTitle.snp.makeConstraints {
            $0.top.equalTo(mainTitle.snp.bottom)
            $0.leading.equalTo(mainTitle.snp.leading)
            $0.trailing.equalToSuperview().inset(10.0)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
    }
    
    func applyShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
}
