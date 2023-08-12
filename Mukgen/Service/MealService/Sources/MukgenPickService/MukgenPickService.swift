import Foundation
import Moya

public enum MukgenPickAPI {
    case fetchRiceMenu
}

extension MukgenPickAPI: TargetType {
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
        return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0eWxlcjA5MjIiLCJpYXQiOjE2OTE3MjMwNTQsImV4cCI6MTY5MTcyNDg1NH0.Rnxn7hxaIjv7-d4VRiocWM3Vh4p-6BuACKm8EV5ogOo"]
    }
}

public class MukgenPickServiceProvider {
    let provider = MoyaProvider<MukgenPickAPI>()
    public func fetchmukgenPick(completion: @escaping (MukgenPickMenuResponse?) -> Void) {
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


