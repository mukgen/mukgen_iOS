import UIKit
import SnapKit
import Then
import Foundation

open class BaseVC: UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
        hideKeyboardWhenTappedArround()
    }
    
    open func hideKeyboardWhenTappedArround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard) )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    open func layout() {}
    open func attribute() {}
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
