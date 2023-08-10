import Foundation
import UIKit
import Moya

open class MukgenPickService {
    public let baseURL = "https://www.mukgen.info"
    public let endpoint = "/mukgen-pick"
    public let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0eWxlcjA5MjIiLCJpYXQiOjE2OTE2NTQwNTcsImV4cCI6MTY5MTY1NTg1N30.j0vwCrsW7BLH-krIMqVRPrhNnVUAFFy0A5R8BrCPMUs"
    //에러에서는 init이 기본값이 internal이다 이기 떄문에 기본을 public으로 수정
    public init() {}
    
    open func fetchRiceMenu1(completion: @escaping (MukgenPickMenuResponse?) -> Void) {
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
                    let mukgenPickMenuResponse = try decoder.decode(MukgenPickMenuResponse.self, from: data)
                    print(mukgenPickMenuResponse)
                    completion(mukgenPickMenuResponse)
                } catch {
                    print("Error: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }.resume()
    }
}
