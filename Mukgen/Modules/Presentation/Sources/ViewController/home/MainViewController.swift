import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class MainViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    let mukgenBuuton = UIButton().then {
        $0.setImage(MukgenKitAsset.Images.navMukgne.image, for: .normal)
        $0.addTarget(self, action: #selector(leftBarButtonTapped), for: .touchUpInside)
        $0.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.width.equalTo(104)
        }
    }
    
    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let cafeteriaView = CafeteriaView(frame: .zero, viewController: self)
        let mukgenPickView = MukgenPickView(frame: .zero, viewController: self)
        let popularPostView = PopularPostView(frame: .zero, viewController: self)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(32.0)
        }
        
        let spacingView2 = UIView()
        spacingView2.snp.makeConstraints {
            $0.height.equalTo(91.0)
        }
        
        [
            cafeteriaView,
            spacingView,
            mukgenPickView,
            spacingView2,
            popularPostView
        ].forEach { stackView.addArrangedSubview($0) }
    }
    
   
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        view.backgroundColor = .white
//        getMeal()
//        mukgenPick()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {

        let leftBarButtonItem = UIBarButtonItem(customView: mukgenBuuton)

        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    @objc func leftBarButtonTapped() {
        print("메인 먹젠 클릭")
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

        
    }
}



