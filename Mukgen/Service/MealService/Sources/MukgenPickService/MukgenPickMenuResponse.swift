import Foundation

public struct MukgenPickMenuResponse: Codable {
    public let month: Int
    public let day: Int
    public let riceType: String
    public let riceId: Int
}
