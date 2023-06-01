import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class MainViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    var mukgenPick = UIView().then {
        $0.backgroundColor = PresentationAsset.Colors.primaryLight3.color
    }
    
    var popularPosts = UILabel().then {
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.text = "인기글"
        $0.textColor = .black
    }
    
    var morePosts = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.text = "더보기"
        $0.textColor = PresentationAsset.Colors.pointLight1.color
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let cafeteriaView = CafeteriaView(frame: .zero, viewController: self)
        
        let spacingView = UIView()
        
        [
            cafeteriaView,
            spacingView
            
        ].forEach { stackView.addArrangedSubview($0) }
    }
    
   
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        mukgenPick.layer.cornerRadius = 10.0
        
        setupLayout()
        view.backgroundColor = .white
    }
}

private extension MainViewController {
    
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
        
        stackView.addSubview(mukgenPick)
        mukgenPick.snp.makeConstraints {
            $0.width.equalTo(353)
            $0.height.equalTo(69)
            $0.top.equalTo(stackView.snp.bottom).offset(32)
            $0.left.equalToSuperview().offset(20)
        }
    
        stackView.addSubview(popularPosts)
        popularPosts.snp.makeConstraints {
            $0.width.equalTo(52)
            $0.height.equalTo(24)
            $0.top.equalTo(mukgenPick.snp.bottom).offset(32)
            $0.left.equalToSuperview().offset(20)
        }
        
        stackView.addSubview(morePosts)
        morePosts.snp.makeConstraints {
            $0.width.equalTo(37)
            $0.height.equalTo(17)
            $0.top.equalTo(mukgenPick.snp.bottom).offset(35.5)
            $0.right.equalToSuperview().inset(20)
        }
    }
}
