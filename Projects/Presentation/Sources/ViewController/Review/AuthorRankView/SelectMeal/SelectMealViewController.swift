import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class SelectMealViewController: BaseVC {
    public var factory: ModuleFactoryInterface!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let selectMealView = SelectMealView(frame: .zero, viewController: self)

        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(134)
        }
        [
            spacingView,
            selectMealView
        ].forEach { stackView.addArrangedSubview($0) }
        
    }
    
    private lazy var guideSelectMeal = UILabel().then {
        $0.numberOfLines = 2
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .black
        $0.text = "리뷰를 작성하고 싶은\n급식을 선택하세요."
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        view.backgroundColor = .white
    }
}


private extension SelectMealViewController {
    
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
        
        contentView.addSubview(guideSelectMeal)
        guideSelectMeal.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.leading.equalToSuperview().offset(20)
        }
    }
}
