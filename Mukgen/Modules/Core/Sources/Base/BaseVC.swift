import UIKit
import SnapKit
import Then
import Foundation

open class BaseVC: UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        attribute()
    }
    
    open func layout() {}
    open func attribute() {}
}
