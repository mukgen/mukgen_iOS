import Foundation
import UIKit

open class TodayMealService {
    public let baseURL = "https://www.mukgen.info"
    public let endpoint = "/meal/today"
    public let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0eWxlcjA5MjIiLCJpYXQiOjE2OTE2NzUxNTQsImV4cCI6MTY5MTY3Njk1NH0.nOArdl0iX5ooWdSRLSZyrstEprdHsV8WYAubfdSS3jY"
    //에러에서는 init이 기본값이 internal이다 이기 떄문에 기본을 public으로 수정
    public init() {}
    
    open func fetchRiceMenu(completion: @escaping ([TodayMealResponse]?) -> Void) {
        let url = URL(string: baseURL + endpoint)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let welcome = try decoder.decode(Welcome.self, from: data)
                    print(welcome.responseList)
                    completion(welcome.responseList)
                } catch {
                    print("Error: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }.resume()
    }
}

