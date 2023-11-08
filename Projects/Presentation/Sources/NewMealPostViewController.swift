import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class NewMealPostViewController: UIViewController {
    
    public var factory: ModuleFactoryInterface!
    
    private var titleTextView: CustomTextView = CustomTextView(maxCharacterCount: 60, textViewHeight: 56, titleText: "제목")
    
    private var detailTextView: CustomTextView = CustomTextView(maxCharacterCount: 300, textViewHeight: 496, titleText: "내용")
    
    private var customButton = UIButton(type: .custom).then {
        $0.setTitle("등록", for: .normal)
        $0.setTitleColor(MukgenKitAsset.Colors.pointBase.color, for: .normal)
        // 나중에 액션 구현해줘
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let customBarButtonItem = UIBarButtonItem(customView: customButton)
        navigationItem.rightBarButtonItem = customBarButtonItem
        
        title = "글쓰기"
        
        view.backgroundColor = .white
        view.addSubview(titleTextView)
        view.addSubview(detailTextView)
        
        titleTextView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(106)
        }
        
        detailTextView.snp.makeConstraints {
            $0.top.equalTo(titleTextView.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(566)
            $0.bottom.lessThanOrEqualToSuperview().offset(-20.0)
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleTextView.textView.becomeFirstResponder()
        detailTextView.textView.becomeFirstResponder()
    }
}
