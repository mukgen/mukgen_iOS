import Foundation
import Moya

public enum PopularPostAPI {
    case fetchPopularPosts
}

extension PopularPostAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://www.mukgen.info")!
    }

    public var path: String {
        switch self {
        case .fetchPopularPosts:
            return "/board/hot"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchPopularPosts:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .fetchPopularPosts:
            return .requestPlain
        }
    }

    public var headers: [String : String]? {
        return Header.accessToken.header()
    }
}

public class PopularPostServiceProvider {
    let provider = MoyaProvider<PopularPostAPI>()
    
    public init() { }
    
    public func fetchPopularPosts(completion: @escaping (Result<[PopularPostResponse], Error>) -> Void) {
        provider.request(.fetchPopularPosts) { (result) in
            switch result {
            case .success(let response):
                do {
                    let welcome = try JSONDecoder().decode(Welcome.self, from: response.data)
                    print(welcome.boardPopularResponseList)
                    completion(.success(welcome.boardPopularResponseList))
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
