import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class MainViewController: BaseVC {
    
    public var factory: ModuleFactoryInterface!
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
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
        getMeal()
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

//func getMeal() {
//
//    struct TodayMeal: Codable {
//        let riceType: String
//        let item: String
//        let riceId: Int
//    }
//
//    var components = URLComponents(string: "https://www.mukgen.info")
//    components?.path = "/meal/today"
//
//    guard let url = components?.url else {
//        fatalError("Invalid URL components")
//    }
//
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//
//    request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0eWxlcjA5MjIiLCJpYXQiOjE2OTAzNjk0MTksImV4cCI6MTY5MDM3MTIxOX0.Oh01WK3_wYaPa4YdYCkIAdOSueqh4JXzb6xct7f56yg",
//                     forHTTPHeaderField: "Authorization")
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Error: \(error)")
//        } else if let data = data {
//            do {
//                print(data)
////                let decoder = JSONDecoder()
////                let resultData = try decoder.decode(TodayMeal.self, from: data)
////                print("riceType: \(resultData.riceType), item: \(resultData.item), riceId: \(resultData.riceId)")
//            } catch {
//                print("Error: \(error)")
//            }
//        }
//    }
//    task.resume()
//}

func getMeal() {
    var jsonEncoder = JSONEncoder()

    var components = URLComponents(string: "https://www.mukgen.info")
    components?.path = "/meal/today"

    guard let url = components?.url else {
        fatalError("Invalid URL components")
    }

    var requeset = URLRequest(url: url)
    requeset.httpMethod = "GET"

    requeset.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0eWxlcjA5MjIiLCJpYXQiOjE2OTAzNjk0MTksImV4cCI6MTY5MDM3MTIxOX0.Oh01WK3_wYaPa4YdYCkIAdOSueqh4JXzb6xct7f56yg", forHTTPHeaderField: "Authorization")

    let task = URLSession.shared.dataTask(with: requeset) { data, response, error in
        if let error = error {
            print("Error: \(error)")
        } else if let data = data {
            do {
                let jsonDataString = String(data: data, encoding: .utf8) ?? ""
                print(jsonDataString)
                
                } catch {
                print("Error during JSON serialization: \(error)")
            }
        }
    }

    task.resume()
}
