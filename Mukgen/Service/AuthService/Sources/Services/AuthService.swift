import Foundation
import Moya
import SwiftKeychainWrapper

public class AuthService {
    private let provider = MoyaProvider<AuthAPI>()
    private var refreshToken: String?

    public init() {}

    public func login(accountId: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        provider.request(.login(accountId: accountId, password: password)) { result in
            switch result {
            case let .success(response):
                let decoder = JSONDecoder()
                do {
                    let loginResponse = try decoder.decode(LoginResponse.self, from: response.data)
                    self.setRefreshToken(token: loginResponse.tokenResponse.refreshToken)
                    Token.accessToken = loginResponse.tokenResponse.accessToken
                    KeychainWrapper.standard.set(loginResponse.tokenResponse.accessToken, forKey: "access_token")

                    completion(.success(loginResponse))
                    print("토큰 저장됨")
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    public func getToken() {
        if let accessToken = KeychainWrapper.standard.string(forKey: "access_token") {
            print("Stored access token:", accessToken)
        } else {
            print("No access token found in Keychain")
        }
    }

    public func setRefreshToken(token: String) {
        refreshToken = token
    }

    public func refreshAccessToken(completion: @escaping (Result<(accessToken: String, refreshToken: String), Error>) -> Void) {
        guard let refreshToken = refreshToken else {
            completion(.failure(NSError(domain: "Refresh token not found", code: -1, userInfo: nil)))
            return
        }

        provider.request(.refresh(token: refreshToken)) { result in
            switch result {
            case let .success(response):
                let decoder = JSONDecoder()
                do {
                    let tokens = try decoder.decode(TokenResponse.self, from: response.data)
                    Token.accessToken = tokens.accessToken
                    self.setRefreshToken(token: tokens.refreshToken)
                    completion(.success((accessToken: tokens.accessToken, refreshToken: tokens.refreshToken)))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
