import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class StartPageViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
        
    private let startButton = CustomButton(title: "시작하기",
                                           backgroundColor: MukgenKitAsset.Colors.pointBase.color,
                                           titleColor: UIColor.white,
                                           font: UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private let loginButton = CustomButton(title: "로그인",
                                           backgroundColor: MukgenKitAsset.Colors.primaryLight3.color, titleColor: UIColor.black,
                                           font: UIFont.systemFont(ofSize: 16, weight: .semibold))
    
    private let whiteBox = UILabel().then {
        $0.backgroundColor = .white
    }
    
    private let mukgenLogo = UIImageView().then {
        $0.image = MukgenKitAsset.Images.mukgenIcon.image
    }
    
    public override func layout() {
        
        view.addSubviews([whiteBox,
                          startButton,
                          loginButton,
                          mukgenLogo])
        
        mukgenLogo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-79.0)
            $0.width.equalTo(160.0)
            $0.height.equalTo(189.0)
        }
        whiteBox.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(192.0)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalTo(whiteBox.snp.centerX)
            $0.top.equalTo(whiteBox.snp.top).offset(24.0)
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(55.0)
        }
        
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(24)
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(55.0)
        }
    }
    
    public override func attribute() {
        view.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        startButton.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
    }
    
    @objc func startButtonDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(StartMukgenViewController(), animated: true)
    }
}
