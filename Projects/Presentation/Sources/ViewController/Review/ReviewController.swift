import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class ReviewController: BaseVC, TodayCafeteriaReviewDelegate {
    func morePostTapped() {
        let destinationVC = MoreReviewViewController()
           navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    public var factory: ModuleFactoryInterface!
    
    weak var delegate: TodayCafeteriaReviewDelegate?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    let userButton = UIButton().then {
        $0.setImage(MukgenKitAsset.Assets.navMukgen.image, for: .normal)
        $0.addTarget(self, action: #selector(rightBarButtonTapped), for: .touchUpInside)
        $0.snp.makeConstraints {
            $0.height.width.equalTo(24)
        }
    }
    
    private lazy var cafeteriaView: AuthorRankView = {
        let view = AuthorRankView(controller: self)
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    private lazy var todayCafeteriaReview: TodayCafeteriaReview = {
        let view = TodayCafeteriaReview(frame: .zero, viewController: self)
        view.delegate = self
        return view
    }()
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    func setupNavigationBar() {

        let rightBarButtonItem = UIBarButtonItem(customView: userButton)

        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func rightBarButtonTapped() {
        print("User 버튼 클릭")
    }
}

private extension ReviewController {
    
    func setupLayout() {
        view.addSubview(cafeteriaView)
        view.addSubview(todayCafeteriaReview)
        cafeteriaView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(200.0)
            $0.width.equalTo(353.0)
        }
        
        todayCafeteriaReview.snp.makeConstraints {
            $0.top.equalTo(cafeteriaView.snp.bottom).offset(50.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.width.equalTo(353.0)
            $0.height.equalTo(402)
        }
    }
}
