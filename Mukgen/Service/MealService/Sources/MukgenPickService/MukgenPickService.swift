import Foundation
import UIKit

open class MukgenPickService {
    public let baseURL = "https://www.mukgen.info"
    public let endpoint = "/mukgen-pick"
    public let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0eWxlcjA5MjIiLCJpYXQiOjE2OTE1ODI4MjAsImV4cCI6MTY5MTU4NDYyMH0.CmTS7k8qar3x_KykuDAoJ4GFJGPkFgJozZ2csWNRaCk"
    
    //에러에서는 init이 기본값이 internal이다 이기 떄문에 기본을 public으로 수정
    public init() {}
    
    open func fetchRiceMenu(completion: @escaping (MukgenPickMenuResponse?) -> Void) {
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
