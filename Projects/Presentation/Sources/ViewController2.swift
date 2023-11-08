import UIKit
import SnapKit
import Then
import INFOKit

public class ViewController2: UIViewController {
       
    var button = UIButton().then {
        $0.backgroundColor = .green
    }
    
    public var factory: ModuleFactoryInterface!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = INFOKitAsset.Colors.mainColor.color
        
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.height.width.equalTo(100)
            $0.centerX.centerY.equalToSuperview()
        }
    }
}


