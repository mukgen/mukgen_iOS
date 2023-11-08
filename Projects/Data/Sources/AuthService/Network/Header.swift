import Foundation

public struct Token {
    static public var localAccessToken: String?
    static public var accessToken: String?
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
