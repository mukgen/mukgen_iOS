import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class SellectNumberOfPersonMainViewController: BaseVC {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0

        let scrollNumberOfPersonPageView = ScrollNumberOfPersonPageView(frame: .zero, viewController: self)
        
        let spacingView1 = UIView()
        spacingView1.snp.makeConstraints {
            $0.height.equalTo(216.0)
        }

        [
            spacingView1,
            scrollNumberOfPersonPageView,
            
        ].forEach { stackView.addArrangedSubview($0) }
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    private let pageCount = UILabel().then {
        $0.text = "2 / 4"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private let inputNicknameLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "몇명을\n모집하시나요?."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    public var beforePageButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.setTitle("이전", for: .normal)
        $0.setTitleColor(MukgenKitAsset.Colors.pointBase.color, for: .normal)
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.systemOrange.cgColor
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
        $0.layer.cornerRadius = 10.0
        $0.addTarget(self, action: #selector(beforePageButtonDidTap(_:)), for: .touchUpInside)
    }
    
    public var nextPageButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = MukgenKitAsset.Colors.pointBase.color
        $0.layer.cornerRadius = 10.0
        $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    public override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false // 뷰 컨트롤러가 사라질 때 나타내기
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupLayout()
        view.backgroundColor = .white
    }
    
    @objc func beforePageButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextPageButtonDidTap(_ sender: UIButton) {
        self.navigationController?.pushViewController(SelectPlaceViewController(), animated: true)
    }
}

private extension SellectNumberOfPersonMainViewController {
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(pageCount)
        pageCount.snp.makeConstraints {
            $0.top.equalToSuperview().offset(76.0)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(inputNicknameLabel)
        inputNicknameLabel.snp.makeConstraints {
            $0.top.equalTo(pageCount.snp.bottom).offset(24.0)
            $0.leading.equalToSuperview().offset(20.0)
        }
        
        view.addSubview(beforePageButton)
        beforePageButton.snp.makeConstraints {
            $0.width.equalTo(161.5)
            $0.height.equalTo(55.0)
            $0.bottom.equalToSuperview().inset(40.0)
            $0.left.equalToSuperview().offset(30.0)
        }
        
        view.addSubview(nextPageButton)
        nextPageButton.snp.makeConstraints {
            $0.width.equalTo(161.5)
            $0.height.equalTo(55.0)
            $0.bottom.equalToSuperview().inset(40.0)
            $0.left.equalTo(beforePageButton.snp.right).offset(10.0)
        }
    }
}
