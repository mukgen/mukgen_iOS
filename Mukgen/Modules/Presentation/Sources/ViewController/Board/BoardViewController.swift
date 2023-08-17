

import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class BoardMainViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
//        let boardTitleView = BoardTitleView(frame: .zero, viewController: self)
        let showFilterView =  ShowFilterView(frame: .zero, viewController: self)
        let boardContentsView = BoardContentsView(frame: .zero, viewController: self)
        
//        let spacingView1 = UIView()
//        spacingView1.snp.makeConstraints {
//            $0.height.equalTo(32)
//        }
//
//        let spacingView2 = UIView()
//        spacingView2.snp.makeConstraints {
//            $0.height.equalTo(100)
//        }

        [
//            spacingView1,
            showFilterView,
            boardContentsView
            
        ].forEach { stackView.addArrangedSubview($0) }
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
   
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupLayout()
        view.backgroundColor = .white
    }
    
    @objc public func plusButtonDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(NewMealPostViewController(), animated: true)
    }
}

private extension BoardMainViewController {
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        
    }
}
