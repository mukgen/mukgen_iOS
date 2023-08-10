import Foundation
import Moya

public enum MukgenAPI {
    case fetchRiceMenu
}

extension MukgenAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://www.mukgen.info")!
    }
    
    public var path: String {
        switch self {
        case .fetchRiceMenu:
            return "/mukgen-pick"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchRiceMenu:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .fetchRiceMenu:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0eWxlcjA5MjIiLCJpYXQiOjE2OTE2NTQwNTcsImV4cCI6MTY5MTY1NTg1N30.j0vwCrsW7BLH-krIMqVRPrhNnVUAFFy0A5R8BrCPMUs"]
    }
}

public class MukgenPickServiceProvider {
    let provider = MoyaProvider<MukgenAPI>()
    public func fetchRiceMenu1(completion: @escaping (MukgenPickMenuResponse?) -> Void) {
        provider.request(.fetchRiceMenu) { (result) in
            switch result {
            case .success(let response):
                do {
                    let mukgenPickMenuResponse = try JSONDecoder().decode(MukgenPickMenuResponse.self, from: response.data)
                    print(mukgenPickMenuResponse)
                    completion(mukgenPickMenuResponse)
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
