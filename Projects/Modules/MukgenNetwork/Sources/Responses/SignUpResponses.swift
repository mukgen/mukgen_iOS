import Foundation

public struct SignUpResponses: Encodable {
    let studentKey: String
    let name: String
    let email: String
    let password: String
    let githubLink: String?
}
