import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import Core

public class AdvertisementView: UIView {
    private final var controller: UIViewController
    
    private lazy var mainImage = UIImageView().then {
        $0.image = INFOKitAsset.Assets.mouImage.image
    }
    
    private lazy var mainTitle = UILabel().then {
        $0.text = ""
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.numberOfLines = 2
    }
    
    private lazy var subTitle = UILabel().then {
        $0.text = ""
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 10.0, weight: .medium)
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainTitle, subTitle])
        stackView.axis = .vertical
        stackView.spacing = 4.0
        return stackView
    }()
    
    public init(frame: CGRect ,viewController: UIViewController, mainTitleText: String, subTitleText: String) {
        self.controller = viewController
        super.init(frame: frame)
        
        
        mainTitle.text = mainTitleText
        subTitle.text = subTitleText
        layout()
        applyShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(mainImage)
        self.addSubview(stackView)
        
        mainImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30.0)
            $0.width.equalTo(62.0)
            $0.height.equalTo(90.0)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30.0)
        }
    }
    
    func applyShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        layer.masksToBounds = false
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
