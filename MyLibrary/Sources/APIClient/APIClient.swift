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
    
    public func login() {
        
        let login = Login(email: "test@test.test", password: "testPassword")

        AF.request("https://httpbin.org/post",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
    }
}

struct Login: Encodable {
    let email: String
    let password: String
}

