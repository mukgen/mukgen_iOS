import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class TextAlertViewController: UIViewController {
    
    public var factory: ModuleFactoryInterface!

    private let showAlertButton = UIButton().then {
        $0.setTitle("알림 표시", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    private let darkeningView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.12)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(showAlertButton)
        showAlertButton.addTarget(self, action: #selector(onShowAlertButtonTapped), for: .touchUpInside)
    }

    private func setupConstraints() {
        showAlertButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    @objc private func onShowAlertButtonTapped() {
        darkeningView.frame = view.bounds
        darkeningView.alpha = 0
        view.addSubview(darkeningView)
        UIView.animate(withDuration: 0.3) {
            self.darkeningView.alpha = 1
        }
        
        let customAlert = CustomAlertView(
            labelText: "TaeYoung1234 님\n환영합니다!",
            buttonLabelText: "확인",
            buttonAction: { [weak self] in
                print("알림 버튼이 눌렸습니다.")
                self?.removeDarkeningView()
            }
        )
        view.addSubview(customAlert)
        customAlert.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func removeDarkeningView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.darkeningView.alpha = 0
        }, completion: { _ in
            self.darkeningView.removeFromSuperview()
        })
    }
}
