import Foundation

public struct Token {
    static var localAccessToken: String?
    static var accessToken: String?
//    {
//        get {
//            localAccessToken = KeychainWrapper.standard.string(forKey: "access_token")
//            return localAccessToken
//        }
//        set(newToken) {
//            KeychainWrapper.standard.set(newToken ?? "nil", forKey: "access_token")
//            localAccessToken = newToken
//        }
//    }
}

public enum Header {
    case accessToken, tokenIsEmpty
    public func header() -> [String: String]? {
        guard let token = Token.accessToken,
            token != "nil" else {
            return ["Content-Type": "application/json", "X-Not-Using-Xquare-Auth": "true"]
        }
        switch self {
        case .accessToken:
            return ["Authorization": "Bearer " + token,
                    "Content-Type": "application/json",
                    "X-Not-Using-Xquare-Auth": "true"]
        case .tokenIsEmpty:
            return ["Content-Type": "application/json",
                    "X-Not-Using-Xquare-Auth": "true"]
        }
    }
}
