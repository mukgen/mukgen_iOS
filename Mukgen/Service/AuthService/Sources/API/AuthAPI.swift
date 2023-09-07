import Foundation
import Moya
import SwiftKeychainWrapper

public enum AuthAPI {
    case login(accountId: String, password: String)
    case refresh(token: String)
}

extension AuthAPI: TargetType {

    public var baseURL: URL {
        return URL(string: "https://stag-server.xquare.app/mukgen")!
    }

    public var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .refresh:
            return "/auth/re-issue"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .login, .refresh:
            return .post
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case let .login(accountId, password):
            return .requestParameters(parameters: ["accountId": accountId, "password": password], encoding: JSONEncoding.default)
        case let .refresh(token):
            return .requestParameters(parameters: ["refreshToken": token], encoding: JSONEncoding.default)
        }
    }

    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
