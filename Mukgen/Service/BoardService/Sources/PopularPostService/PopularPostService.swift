import Foundation
import Moya

public enum PopularPostAPI {
    case fetchRiceMenu1
}

extension PopularPostAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://www.mukgen.info")!
    }

    public var path: String {
        switch self {
        case .fetchRiceMenu1:
            return "/board/hot"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchRiceMenu1:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .fetchRiceMenu1:
            return .requestPlain
        }
    }

    public var headers: [String : String]? {
        return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0eWxlcjA5MjIiLCJpYXQiOjE2OTE2NzUxNTQsImV4cCI6MTY5MTY3Njk1NH0.nOArdl0iX5ooWdSRLSZyrstEprdHsV8WYAubfdSS3jY"]
    }
}

public class PopularPostServiceProvider {
    let provider = MoyaProvider<PopularPostAPI>()
    public func fetchPopularPost(completion: @escaping (PopularPostResponse?) -> Void) {
        provider.request(.fetchRiceMenu1) { (result) in
            switch result {
            case .success(let response):
                do {
                    let popularPostResponse = try JSONDecoder().decode(PopularPostResponse.self, from: response.data)
                    print(popularPostResponse)
                    completion(popularPostResponse)
                } catch {
                    print("Error: \(error.localizedDescription)")
                    completion(nil)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }

    public init() {
    }
}



//import Foundation
//import UIKit
//
//open class PopularPostService {
//    public let baseURL = "https://www.mukgen.info"
//    public let endpoint = "/board/hot"
//    public let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0eWxlcjA5MjIiLCJpYXQiOjE2OTE2NzUxNTQsImV4cCI6MTY5MTY3Njk1NH0.nOArdl0iX5ooWdSRLSZyrstEprdHsV8WYAubfdSS3jY"
//    //에러에서는 init이 기본값이 internal이다 이기 떄문에 기본을 public으로 수정
//    public init() {}
//    
//    open func fetchPopularPost(completion: @escaping ([PopularPostResponse]?) -> Void) {
//        let url = URL(string: baseURL + endpoint)
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                completion(nil)
//            } else if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let welcome = try decoder.decode(Welcome.self, from: data)
//                    print(welcome.boardPopularResponseList)
//                    completion(welcome.boardPopularResponseList)
//                } catch {
//                    print("Error: \(error.localizedDescription)")
//                    completion(nil)
//                }
//            }
//        }.resume()
//    }
//}
//
//
