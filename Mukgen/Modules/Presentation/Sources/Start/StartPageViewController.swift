import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class StartPageViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
        
    private let startButton: CustomButton = {
        let button = CustomButton(
            title: "시작하기",
            backgroundColor: MukgenKitAsset.Colors.primaryBase.color,
            titleColor: UIColor.white,
            font: UIFont.systemFont(ofSize: 16, weight: .semibold)
        )
        return button
    }()
    
    private let loginButton = CustomButton(title: "로그인",
                                           backgroundColor: MukgenKitAsset.Colors.primaryLight3.color, titleColor: UIColor.black,
                                           font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    )
    
    private let whiteBox = UILabel().then {
        $0.backgroundColor = .white
    }
    
    private let mukgenLogo = UIImageView().then {
        $0.image = MukgenKitAsset.Images.mukgenIcon.image
    }
    
    public override func layout() {
        
        [
            whiteBox,
            startButton,
            loginButton,
            mukgenLogo
        ].forEach { view.addSubview($0) }

        
        let buttonHight = 55
        
        mukgenLogo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(272)
            $0.width.equalTo(160)
            $0.height.equalTo(189)
        }
        whiteBox.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(192)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalTo(whiteBox.snp.centerX)
            $0.top.equalTo(whiteBox.snp.top).offset(24)
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(buttonHight)
        }
        
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(24)
            $0.width.equalToSuperview().inset(20.0)
            $0.height.equalTo(buttonHight)
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
