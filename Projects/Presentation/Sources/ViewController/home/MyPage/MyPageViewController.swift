import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class MyPageViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    private lazy var myimage = UIImageView().then {
        $0.image = MukgenKitAsset.Assets.myPageTestImage.image
    }
    
    private lazy var changeMyPageImgButton = UIButton().then {
        $0.setImage(MukgenKitAsset.Assets.check.image, for: .normal)
        $0.backgroundColor = .clear
    }
    
    private lazy var userNmae = UILabel().then {
        $0.text = "부현수"
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private lazy var userPageIcon = UIImageView().then {
        $0.image = MukgenKitAsset.Assets.userPageArrow.image
    }
     
    private lazy var userPage = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.setTitle("회원 정보", for: .normal)
        $0.setTitleColor(MukgenKitAsset.Colors.primaryLight2.color, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private lazy var lineView = UIImageView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight3.color
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(210)
        }
        
        let myPostView = MyPostView(frame: .zero, viewController: self)
        
        [spacingView, myPostView].forEach {
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        view.backgroundColor = .white
    }
    
    @objc func buttonTapped() {
        print("버튼이 클릭되었습니다.")
    }
}

private extension MyPageViewController {
    
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
        
        contentView.addSubview(myimage)
        contentView.addSubview(changeMyPageImgButton)
        contentView.addSubview(userNmae)
        contentView.addSubview(userPageIcon)
        contentView.addSubview(userPage)
        contentView.addSubview(lineView)
        
        myimage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(30.0)
            $0.width.height.equalTo(80)
        }
        
        changeMyPageImgButton.snp.makeConstraints {
            $0.top.equalTo(myimage.snp.top).offset(56.67)
            $0.left.equalTo(myimage.snp.left).offset(56.67)
            $0.width.height.equalTo(23.33)
        }
        
        userNmae.snp.makeConstraints {
            $0.top.equalToSuperview().offset(93.0)
            $0.left.equalTo(myimage.snp.right).offset(20)
        }
        
        userPageIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(95)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        userPage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(95)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(72)
            $0.height.equalTo(20)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(myimage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(6)
        }
    }
}
