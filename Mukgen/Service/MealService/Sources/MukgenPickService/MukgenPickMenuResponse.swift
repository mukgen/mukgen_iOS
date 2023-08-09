import Foundation

public struct MukgenPickMenuResponse: Codable {
    public let month: Int
    let day: Int
    let riceType: String
    let riceId: Int
}
