import Foundation

public struct LoginResponse: Codable {
    public let tokenResponse: TokenResponse
    public let message: String
}
