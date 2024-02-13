import Foundation
import Alamofire

public struct APIClient {
    private init() {}
    public static let shared = APIClient()
    
    public func request() {
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
    }
}

