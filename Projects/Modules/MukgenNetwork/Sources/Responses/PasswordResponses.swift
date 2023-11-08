import Foundation

public struct PasswordResponses: Codable {
    let email: String
    let code: String
    let newPassword: String
}
