import Foundation
import Moya

public enum TodayMealAPI {
    case fetchTodayMeal
}

extension TodayMealAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://www.mukgen.info")!
    }

    public var path: String {
        switch self {
        case .fetchTodayMeal:
            return "/meal/today"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchTodayMeal:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .fetchTodayMeal:
            return .requestPlain
        }
    }

    public var headers: [String : String]? {
        return Header.accessToken.header()
    }
}

public class TodayMealServiceProvider {
    let provider = MoyaProvider<TodayMealAPI>()

    public init() {}

    public func fetchTodayMeal(completion: @escaping (Result<[TodayMealResponse], Error>) -> Void) {
        provider.request(.fetchTodayMeal) { (result) in
            switch result {
            case .success(let response):
                do {
                    let welcome = try JSONDecoder().decode(Welcome.self, from: response.data)
                    print(welcome.responseList)
                    completion(.success(welcome.responseList))
                } catch {
                    print("Error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
