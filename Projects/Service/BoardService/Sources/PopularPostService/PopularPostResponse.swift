import Foundation

public struct Welcome: Codable {
    let boardPopularResponseList: [PopularPostResponse]
}

public struct PopularPostResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case boardId = "boardId"
        case title
        case commentCount
        case viewCount
    }
    
    public let boardId: CLong
    public let title: String
    public let commentCount: Int
    public let viewCount: Int
}
