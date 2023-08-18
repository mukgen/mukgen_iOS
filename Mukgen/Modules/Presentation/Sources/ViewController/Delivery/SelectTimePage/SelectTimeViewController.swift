import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class SelectTimeViewController: BaseVC {
    
    private let sellectTimeText = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "몇시에\n만나실 건가요?"
        $0.backgroundColor = .white
        $0.tintColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let pageCount = UILabel().then {
        $0.text = "4 / 4"
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }

    
    private let recruitButton = CustomButton(title: "모집하기",
                                             backgroundColor: MukgenKitAsset.Colors.pointBase.color, titleColor: UIColor.white,
                                             font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    )
    
    private let beforePageButton = CustomButton(title: "뒤로",
                                                backgroundColor: MukgenKitAsset.Colors.primaryLight3.color, titleColor: UIColor.black,
                                                font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
        $0.addTarget(self, action: #selector(beforePageButtonDidTap(_:)), for: .touchUpInside)
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let selectTimeView = SelectTimeView(frame: .zero, viewController: self)
        
        let spacingView1 = UIView()
        spacingView1.snp.makeConstraints {
            $0.height.equalTo(176)
        }
        
        [
            spacingView1,
            selectTimeView,
            
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
    
    public override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func beforePageButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

private extension SelectTimeViewController {
    
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
        
        view.addSubview(pageCount)
        view.addSubview(sellectTimeText)
        
        pageCount.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(134)
            $0.right.equalToSuperview().inset(20)
        }
        
        sellectTimeText.snp.makeConstraints() {
            $0.top.equalTo(pageCount.snp.bottom).offset(24.0)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        view.addSubview(recruitButton)
        recruitButton.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(105.0)
            $0.leading.equalToSuperview().offset(20.0)
            $0.width.equalTo(353.0)
            $0.height.equalTo(55.0)
        }
        
        view.addSubview(beforePageButton)
        beforePageButton.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(40.0)
            $0.leading.equalToSuperview().offset(20.0)
            $0.width.equalTo(353.0)
            $0.height.equalTo(55.0)
        }
    }
}




