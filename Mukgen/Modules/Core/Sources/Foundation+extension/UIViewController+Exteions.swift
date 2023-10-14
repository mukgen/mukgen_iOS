import UIKit
import SnapKit
import Then

extension UIViewController {
    func showAlert(labelText: String, buttonLabelText: String, bottonAction: @escaping () -> Void) {
        guard let window = UIApplication.shared.windows.first else { return }
        
        let alertView = CustomAlertView(labelText: labelText, buttonLabelText: buttonLabelText, buttonAction: bottonAction)
        
        window.addSubview(alertView)
        
        alertView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
