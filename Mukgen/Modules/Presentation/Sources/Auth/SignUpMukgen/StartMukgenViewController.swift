import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class StartMukgenViewController: BaseSV {
    
    public var factory: ModuleFactoryInterface!
    
    private let startLabel = UILabel().then {
        $0.text = "시작하기"
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let mukgenInfo = UILabel().then {
        $0.text = "먹젠과 함께 학교에서 즐거운 식생활을 누려보세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWith(self)
        
        view.backgroundColor = .white
        
        mukgenLogo.image = MukgenKitAsset.Images.signUpMukgenIcon.image
        
        buttonBackView.backgroundColor = .clear
                
        secondButton = CustomButton(title: "시작하기",
                                   backgroundColor: MukgenKitAsset.Colors.primaryBase.color,
                                   titleColor: UIColor.white,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold))
        
        view.addSubviews([startLabel, mukgenInfo, mukgenLogo, buttonBackView,firstButton,  secondButton])
        
        startLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(123)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(29)
        }
        
        mukgenInfo.snp.makeConstraints {
            $0.top.equalTo(startLabel.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(19)
        }
        
        mukgenLogo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(view.safeAreaLayoutGuide).offset(200.0) // 레이아웃 에러 고쳐주세요
            $0.width.equalTo(160.0)
            $0.height.equalTo(160.0)
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


//public class StartMukgenViewController: BaseVC {
//
//    public var factory: ModuleFactoryInterface!
//
//    private let startButton = CustomButton(title: "시작하기",
//                                           backgroundColor: MukgenKitAsset.Colors.primaryDark1.color,
//                                           titleColor: UIColor.white,
//                                           font: UIFont.systemFont(ofSize: 16, weight: .semibold)).then {
//        $0.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
//    }
//
//    private let startLabel = UILabel().then {
//        $0.text = "시작하기"
//        $0.backgroundColor = .white
//        $0.font = .systemFont(ofSize: 24, weight: .semibold)
//    }
//
//    private let mukgenInfo = UILabel().then {
//        $0.text = "먹젠과 함께 학교에서 즐거운 식생활을 누려보세요."
//        $0.backgroundColor = .white
//        $0.font = .systemFont(ofSize: 16, weight: .regular)
//    }
//
//    private let mukgenStartIcon = UIImageView().then {
//        $0.image = MukgenKitAsset.Images.signUpMukgenIcon.image
//    }
//
//    public override func layout() {
//
//        view.addSubviews([startButton, startLabel, mukgenInfo, mukgenStartIcon])
//
//        startLabel.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(123)
//            $0.left.equalToSuperview().offset(20)
//            $0.width.equalToSuperview()
//            $0.height.equalTo(29)
//        }
//
//        mukgenInfo.snp.makeConstraints {
//            $0.top.equalTo(startLabel.snp.bottom).offset(24)
//            $0.left.equalToSuperview().offset(20)
//            $0.width.equalToSuperview()
//            $0.height.equalTo(19)
//        }
//
//        mukgenStartIcon.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(mukgenInfo.snp.bottom).offset(151)
//            $0.width.height.equalTo(160)
//        }
//
//        startButton.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(mukgenStartIcon.snp.bottom).offset(257)
//            $0.width.equalTo(353)
//            $0.height.equalTo(55)
//        }
//    }
//
//    public override func attribute() {
//        view.backgroundColor = .white
//    }
//
//    @objc func startButtonDidTap(_ sender: Any) {
//        self.navigationController?.pushViewController(InputNicknameViewController(), animated: true)
//    }
//}
