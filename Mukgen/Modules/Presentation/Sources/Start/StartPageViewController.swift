import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class StartPageViewController: BaseSV {
    
    public var factory: ModuleFactoryInterface!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWith(self)
        
        view.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        
        mukgenLogo.image = MukgenKitAsset.Images.mukgenIcon.image
        
        buttonBackView.backgroundColor = .white
        
        firstButton = CustomButton(title: "로그인",
                                    backgroundColor: MukgenKitAsset.Colors.primaryLight3.color, titleColor: UIColor.black,
                                    font: UIFont.systemFont(ofSize: 16, weight: .semibold))
        
        secondButton = CustomButton(title: "시작하기",
                                   backgroundColor: MukgenKitAsset.Colors.pointBase.color,
                                   titleColor: UIColor.white,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold))
        
        view.addSubviews([mukgenLogo, buttonBackView, firstButton, secondButton])
        
        firstButton.snp.makeConstraints {
            $0.centerX.equalTo(buttonBackView.snp.centerX)
            $0.top.equalTo(buttonBackView.snp.top).offset(24.0)
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(55.0)
        }
        
        secondButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(firstButton.snp.bottom).offset(24)
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(55.0)
        }
    }
}
