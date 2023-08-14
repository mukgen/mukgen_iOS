import Foundation
import SwiftKeychainWrapper
import UIKit
import Moya


public class AuthService {
    
    private var refreshToken: String?
    
    public init() {}
    
    // 로그인하면 자동으로 토큰 줍니다 그거 사용해도되요
    public func login(accountId: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let urlString = "https://www.mukgen.info/auth/login"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        let parameters: [String: Any] = [
            "accountId": accountId,
            "password": password
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            
            switch statusCode {
            case 200, 201:
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    self?.setRefreshToken(token: loginResponse.tokenResponse.refreshToken)
                    Token.accessToken = loginResponse.tokenResponse.accessToken
                    KeychainWrapper.standard.set(loginResponse.tokenResponse.accessToken, forKey: "access_token")
                    completion(.success(loginResponse))
                    print("토큰 저장됨")
                } catch {
                    completion(.failure(error))
                }
            case 404, 400:
                do {
                    let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    completion(.failure(NSError(domain: errorResponse.message, code: statusCode, userInfo: nil)))
                } catch {
                    completion(.failure(error))
                }
            default:
                completion(.failure(NSError(domain: "Unexpected status code", code: statusCode, userInfo: nil)))
            }
        }
        task.resume()
    }
    
    public func getToken() {
        if let accessToken = KeychainWrapper.standard.string(forKey: "access_token") {
            print("Stored access token:", accessToken)
        } else {
            print("No access token found in Keychain")
        }
    }

    // 토큰 주는 코드
    public func setRefreshToken(token: String) {
            refreshToken = token
        }

        public func refreshAccessToken(completion: @escaping (Result<(accessToken: String, refreshToken: String), Error>) -> Void) {
            guard let refreshToken = refreshToken else {
                completion(.failure(NSError(domain: "Refresh token not found", code: -1, userInfo: nil)))
                return
            }

            let urlString = "https://www.example.com/auth/re-issue"
            guard let url = URL(string: urlString) else {
                completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Bearer \(refreshToken)", forHTTPHeaderField: "Authorization")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                    return
                }

                do {
                    let tokens = try JSONDecoder().decode(TokenResponse.self, from: data)
                    Token.accessToken = tokens.accessToken
                    self.setRefreshToken(token: tokens.refreshToken)
                    completion(.success((accessToken: tokens.accessToken, refreshToken: tokens.refreshToken)))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
}
