import Foundation
import SwiftKeychainWrapper

public struct Token {
    static var localAccessToken: String?
    static var accessToken: String? {
        get {
            localAccessToken = KeychainWrapper.standard.string(forKey: "acccess_token")
            return localAccessToken
        }
        set(newToken) {
            KeychainWrapper.standard.set(newToken ?? "nil", forKey: "acccess_token")
            localAccessToken = newToken
        }
    }
    static func removeToken() {
        self.accessToken = nil
    }
}

public enum Header {
    case accessToken, tokenIsEmpty
    public func header() -> [String: String]? {
        guard let token = Token.accessToken,
            token != "nil" else {
            return ["Content-Type": "application/json"]
        }
        switch self {
        case .accessToken:
            return ["Authorization": "Bearer " + token, "Content-Type": "application/json"]
        case .tokenIsEmpty:
            return ["Content-Type": "application/json"]
        }
    }
}
