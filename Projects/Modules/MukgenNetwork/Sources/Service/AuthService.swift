import Foundation
import Moya
import RxSwift
import RxMoya

public class AuthService {
    public let provider = MoyaProvider<AuthAPI>(plugins: [MoyaLoggingPlugin()])
    
    public func login(email: String, password: String) -> Single<Token> {
        return provider.rx
            .request(.login(email: email, password: password))
            .filterSuccessfulStatusCodes()
            .map(Token.self)
    }
    
    public func sendCode(email: String) -> Single<Void> {
        return provider.rx
            .request(.sandCode(email: email))
            .filterSuccessfulStatusCodes()
            .map { _ in Void() }
    }
    
    public func checkCode(email: String, data: String, type: String) -> Single<Void> {
        return provider.rx
            .request(.checkCode(email: email, data: data, type: type))
            .filterSuccessfulStatusCodes()
            .map { _ in }
    }
    
    public func signUp(emailCode: String, studentKey: String, name: String, email: String, password: String, githubLink: String?) -> Single<Void> {
        let signUpParameters = SignUpResponses(studentKey: studentKey, name: name, email: email, password: password, githubLink: githubLink)
        return provider.rx
            .request(.signup(emailCode: emailCode, parameters: signUpParameters))
            .filterSuccessfulStatusCodes()
            .map { _ in Void() }
    }
    
    public func reissueToken() -> Single<Token> {
        return provider.rx
            .request(.reissue)
            .filterSuccessfulStatusCodes()
            .map(Token.self)
    }
    
    public func checkTokenTime(token: String) -> Single<Int> {
        return provider.rx
            .request(.tokenTime(token: token))
            .filterSuccessfulStatusCodes()
            .map { response in
                let jsonDecoder = JSONDecoder()
                let remainingTime = try jsonDecoder.decode(Int.self, from: response.data)
                return remainingTime
            }
    }
    
    public init() {
    }
}
