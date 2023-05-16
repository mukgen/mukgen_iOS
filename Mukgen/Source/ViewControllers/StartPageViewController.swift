import UIKit
import SnapKit
import Then

final class StartPageViewController: UIViewController {
    
    private let startButton = CustomButton(title: "시작하기",
                                   backgroundColor: .pointBase, titleColor: .white,
                                   font: UIFont.systemFont(ofSize: 16, weight: .bold)
    ).then {
        $0.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
    }
    
    private let loginButton = CustomButton(title: "로그인",
                                   backgroundColor: .primaryLight3, titleColor: .black,
                                   font: UIFont.systemFont(ofSize: 16, weight: .bold)
    )
    
    private let whiteBox = UILabel().then {
        $0.backgroundColor = .white
    }
    
    private let mukgenLogo = UIImageView().then {
        $0.image = UIImage(named: "MukgenIcon")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        attribute()
    }
    
    private func layout() {
        
        [
            whiteBox,
            startButton,
            loginButton,
            mukgenLogo
        ].forEach { view.addSubview($0) }

        
        let buttonWidth = 353
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
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonHight)
        }
        
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(24)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonHight)
        }
    }
    
    private func attribute() {
        view.backgroundColor = .primaryLight3
    }
    
    @objc func startButtonDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(StartMukgenViewController(), animated: true)
    }
}
