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

func getMeal() {

    var jsonEncoder = JSONEncoder()

    var components = URLComponents(string: "https://www.mukgen.info")
    components?.path = "/meal/today"

    guard let url = components?.url else {
        fatalError("Invalid URL components")
    }

    var requeset = URLRequest(url: url)
    requeset.httpMethod = "GET"

    requeset.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhenhjdjE3NjgiLCJpYXQiOjE2OTAxNjMxNDksImV4cCI6MTY5MDE2NDk0OX0.1gSNCdKJtZjGMbdRkTFLj4agQZ_-rf8_x8JdXklHkm4", forHTTPHeaderField: "Authorization")

//    var resultData: Any

    let task = URLSession.shared.dataTask(with: requeset) { data, response, error in
        if let error = error {
            print("Error: \(error)")
        } else if let data = data {
            do {
                let resultData = String(data: data, encoding: .utf8) ?? ""
                print(resultData)
            }
        }
    }
//    var jsonData: Any
//    jsonData = resultData
//
//    do {
//        if let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: [])as? [[String: Any]] {
//            for json in jsonArray {
//                let item = json["item"]as? String
//                print("\(item)")
//            }
//        }
//
//
//        }

    task.resume()
}

//func getMeal() {
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
//    request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoeXVuc3UxNzY4IiwiaWF0IjoxNjkwMTU1ODcwLCJleHAiOjE2OTAxNTc2NzB9.q_mnUfJYsiAam3q5P05gV3SxSVFntD9FjORRV6OViFY", forHTTPHeaderField: "Authorization")
//
//    let semaphore = DispatchSemaphore(value: 0)
//
//    URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//        defer {
//            semaphore.signal()
//        }
//
//        if let error = error {
//            print("Error: \(error)")
//            return
//        }
//
//        guard let data = data else {
//            print("Error: no data received")
//            return
//        }
//
//        do {
//            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
//                for json in jsonArray {
//                    if let item = json["responseList"] as? String {
//                        print(item)
//                    }
//                }
//            } else {
//                print("Error converting data to JSON array")
//            }
//        } catch {
//            print("Error during JSON serialization: \(error)")
//        }
//
//    }.resume()
//
//    semaphore.wait()
//}

//getMeal()

//func getMeal() {
//    var jsonEncoder = JSONEncoder()
//
//    var components = URLComponents(string: "https://www.mukgen.info")
//    components?.path = "/meal/today"
//
//    guard let url = components?.url else {
//        fatalError("Invalid URL components")
//    }
//
//    var requeset = URLRequest(url: url)
//    requeset.httpMethod = "GET"
//
//    requeset.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoeXVuc3UxNzY4IiwiaWF0IjoxNjkwMTU1ODcwLCJleHAiOjE2OTAxNTc2NzB9.q_mnUfJYsiAam3q5P05gV3SxSVFntD9FjORRV6OViFY", forHTTPHeaderField: "Authorization")
//
//    let task = URLSession.shared.dataTask(with: requeset) { data, response, error in
//        if let error = error {
//            print("Error: \(error)")
//        } else if let data = data {
//            do {
//                let jsonDataString = String(data: data, encoding: .utf8) ?? ""
//                print(jsonDataString)
//
//                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
//
//                    for json in jsonArray {
//                        let riceType = json["riceType"] as? String
//                        let item = json["item"] as? String
//                        let riceId = json["riceId"] as? String
//                        print(item)
//                    }
//                }
//            } catch {
//                print("Error during JSON serialization: \(error)")
//            }
//        }
//    }
//
//    task.resume()
//}
