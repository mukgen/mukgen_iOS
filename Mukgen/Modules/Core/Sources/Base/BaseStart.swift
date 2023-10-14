import UIKit
import SnapKit
import Then

open class BaseSV: BaseVC {
    
    public var mukgenLogo = UIImageView()
    
    public var buttonBackView = UIView().then {
        $0.backgroundColor = .white
    }
    
    public var firstButton = UIButton()
    
    public var secondButton = UIButton()
    
    public func updateWith(_ controller: UIViewController) {
        controller.view.addSubviews([mukgenLogo, buttonBackView, firstButton, secondButton])
        
        mukgenLogo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-79.0)
            $0.width.equalTo(160.0)
            $0.height.equalTo(189.0)
        }
        buttonBackView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(192.0)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
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
