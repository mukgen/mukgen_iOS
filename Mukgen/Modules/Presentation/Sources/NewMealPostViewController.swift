import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class NewMealPostViewController: UIViewController {
    
    public var factory: ModuleFactoryInterface!
    
    var titleTextView: CustomTextView = CustomTextView(maxCharacterCount: 60, textViewHeight: 56)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: nil, action: nil)
        
        title = "글쓰기"
        
        view.backgroundColor = .white
        view.addSubview(titleTextView)
        
        titleTextView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleTextView.textView.becomeFirstResponder()
    }
}
