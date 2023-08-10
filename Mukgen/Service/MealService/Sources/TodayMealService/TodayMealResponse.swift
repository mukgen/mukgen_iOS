import Foundation

public struct Welcome: Codable {
    let responseList: [TodayMealResponse]
}

public struct TodayMealResponse: Codable {
    public let riceType: String
    public let items: [String]
    public let riceID: Int

    enum CodingKeys: String, CodingKey {
        case riceType, items
        case riceID = "riceId"
    }
}
