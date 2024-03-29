import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class DeliveryViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let deliveryContentsView = DeliveryContentsView(frame: .zero, viewController: self)
        
        let spacingView1 = UIView()
        spacingView1.snp.makeConstraints {
            $0.height.equalTo(8.0)
        }
        
        let spacingView2 = UIView()
        spacingView2.snp.makeConstraints {
            $0.height.equalTo(64)
        }

        [
            spacingView1,
            deliveryContentsView,
        ].forEach { stackView.addArrangedSubview($0) }
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    var plusButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 30
        $0.addTarget(self, action: #selector(plusDidTap), for: .touchUpInside)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupLayout()
        view.backgroundColor = .white
    }
    
    @objc func plusDidTap()
    {
        print("클릭됨")
        navigationController?.pushViewController(SellectMenuViewController(), animated: true)
    }
}

private extension DeliveryViewController {
    
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
        
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.bottom.equalToSuperview().inset(20.0)
            $0.right.equalToSuperview().inset(20.0)
        }
        
    }
}

