import Foundation

public struct Welcome: Codable {
    let responseList: [TodayMealResponse]
}

public enum MealType: String {
    case breakfast = "아침"
    case lunch = "점심"
    case dinner = "저녁"
}

public struct TodayMealResponse: Codable {
    public let riceType: String
    public let items: [String]
    public let riceID: Int

    enum CodingKeys: String, CodingKey {
        case riceType, items
        case riceID = "riceId"
    }

    public func mealType() -> MealType? {
        return MealType(rawValue: riceType)
    }
}
