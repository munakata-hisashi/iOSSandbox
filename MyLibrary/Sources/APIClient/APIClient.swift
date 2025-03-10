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
    
    /// JSONParameterEncoder example
    /// レスポンスボディにパラメータを追加
    public func login() {
        
        let login = Login(email: "test@test.test", password: "testPassword")

        AF.request("https://httpbin.org/post",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
    }
    
    /// URLEncodedFormParameterEncoder example
    /// URLEncodedFormParameterEncoderのdestinationをmethodDependentにするとHTTPのメソッドに合わせてクエリパラメータかリクエストボディにパラメータを追加してくれる
    public func methodDependent() {
        let parameters = ["foo": "bar"]

        // 以下の
        // AF.request("https://httpbin.org/get", parameters: parameters) // encoding defaults to `URLEncoding.default`
        // AF.request("https://httpbin.org/get", parameters: parameters, encoder: URLEncodedFormParameterEncoder.default)
        AF.request("https://httpbin.org/get", parameters: parameters, encoder: URLEncodedFormParameterEncoder(destination: .methodDependent)).response { response in
            debugPrint(response)
        }

        // https://httpbin.org/get?foo=bar
    }
    
    public func httpBody() {
        let parameters: [String: [String]] = [
            "foo": ["bar"],
            "baz": ["a", "b"],
            "qux": ["x", "y", "z"]
        ]

        // All three of these calls are equivalent
        // AF.request("https://httpbin.org/post", method: .post, parameters: parameters)
        // AF.request("https://httpbin.org/post", method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default)
        AF.request("https://httpbin.org/post", method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder(destination: .httpBody)).response { response in
            debugPrint(response)
        }

        // HTTP body: "qux[]=x&qux[]=y&qux[]=z&baz[]=a&baz[]=b&foo[]=bar"
    }
    
    public func queryString() {
        let parameters = ["foo": "bar"]

        AF.request("https://httpbin.org/get", parameters: parameters, encoder: URLEncodedFormParameterEncoder(destination: .queryString)).response { response in
            debugPrint(response)
        }
    }
}

struct Login: Encodable {
    let email: String
    let password: String
}

