

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
        
        let boardTitleView = BoardTitleView(frame: .zero, viewController: self)
        let showFilterView =  ShowFilterView(frame: .zero, viewController: self)
        let boardContentsView =  BoardContentsView(frame: .zero, viewController: self)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(61.0)
        }
        
        let spacingView1 = UIView()
        spacingView1.snp.makeConstraints {
            $0.height.equalTo(93.0)
        }

        [
            boardTitleView,
            spacingView,
            showFilterView,
            spacingView1,
            boardContentsView
            
        ].forEach { stackView.addArrangedSubview($0) }
    }
    
   
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        view.backgroundColor = .white
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
