import Foundation
import Moya
import Core
import RxMoya
import RxSwift
import RxCocoa

public enum AuthAPI {
    case login(email: String, password: String)
    case sandCode(email: String)
    case checkCode(email: String, data: String, type: String)
    case signup(emailCode: String, parameters: SignUpResponses)
    case reissue
    case tokenTime(token: String)
    case resetPassword(PasswordResponses)
}

extension AuthAPI: TargetType {
    public var baseURL: URL {
        return URL.baseURL
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/auth/login/user"
        case .sandCode:
            return "/auth/code"
        case .checkCode:
            return "/auth/code"
        case .signup:
            return "/auth/signup/student"
        case .reissue:
            return "/auth/reissue"
        case .tokenTime:
            return "/auth/token"
        case .resetPassword:
            return "/auth/password"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .sandCode:
            return .put
        case .checkCode:
            return .post
        case .signup:
            return .post
        case .reissue:
            return .put
        case .tokenTime:
            return .get
        case .resetPassword:
            return .put
        }
    }
    
    public var task: Task {
        switch self {
        case let .login(email, password):
            let parameters = ["email": email, "password": password]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case let .sandCode(email):
            let parameters = ["email": email]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case let .checkCode(email, data, type):
            let parameters = ["email": email, "data": data, "type": type]
             return .requestJSONEncodable(parameters)
        case let .signup(emailCode, parameters):
            let requestParameters: [String: Any] = [
                "studentKey": parameters.studentKey,
                "name": parameters.name,
                "email": parameters.email,
                "password": parameters.password,
                "githubLink": parameters.githubLink ?? ""
            ]
            
            let parameters = ["emailCode": emailCode]
            let body = try? JSONSerialization.data(withJSONObject: requestParameters)
            return .requestCompositeData(bodyData: body ?? Data(), urlParameters: parameters)
        case .reissue:
             return .requestPlain
        case .tokenTime(let token):
            let parameters: [String : Any] = ["token": token]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .resetPassword(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
