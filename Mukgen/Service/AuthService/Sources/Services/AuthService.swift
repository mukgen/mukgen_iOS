import Foundation
import RxMoya
import UIKit
import Moya
import RxSwift
//import SwiftKeychainWrapper

public class AuthService {
    private let provider = MoyaProvider<AuthAPI>()
    private var refreshToken: String?
    private let disposeBag = DisposeBag()

    public init() {}

    public func login(accountId: String, password: String) -> Single<LoginResponse> {
                
        return provider.rx.request(.login(accountId: accountId, password: password))
            .filterSuccessfulStatusCodes()
            .map(LoginResponse.self)
            .do(onSuccess: { [weak self] loginResponse in
                self?.setRefreshToken(token: loginResponse.tokenResponse.refreshToken)
                Token.accessToken = loginResponse.tokenResponse.accessToken
//                KeychainWrapper.standard.set(loginResponse.tokenResponse.accessToken, forKey: "access_token")
                print("토큰 저장됨")
            })
    }

//    public func getToken() -> Single<String>
//    {
//        if let accessToken = KeychainWrapper.standard.string(forKey: "access_token") {
//            print("Stored access token:", accessToken)
//            return Single.just(accessToken)
//        } else {
//            print("No access token found in Keychain")
//            return Single.error(NSError(domain:"No access token found in Keychain", code:-1 , userInfo:nil))
//        }
//    }

    private func setRefreshToken(token: String) {
        refreshToken = token
    }

    public func refreshAccessToken() -> Single<(accessToken:String, refreshToken:String)> {
        guard let refreshToken = self.refreshToken else {
             return Single.error(NSError(domain:"Refresh token not found", code:-1 , userInfo:nil))
         }
        
         return provider.rx.request(.refresh(token : refreshToken))
             .filterSuccessfulStatusCodes()
             .map(TokenResponse.self)
             .do(onSuccess:{ [weak self] tokens in
                 Token.accessToken = tokens.accessToken
                 self?.setRefreshToken(token : tokens.refreshToken)
              })
              .map { ($0.accessToken, $0.refreshToken) }
     }
}
