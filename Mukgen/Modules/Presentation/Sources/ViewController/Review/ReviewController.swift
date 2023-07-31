import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class ReviewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var cafeteriaView: AuthorRankView = {
        let view = AuthorRankView(controller: self)
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    private lazy var todayCafeteriaReview: TodayCafeteriaReview = {
        let view = TodayCafeteriaReview(frame: .zero, viewController: self)
        return view
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        view.backgroundColor = .white
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
