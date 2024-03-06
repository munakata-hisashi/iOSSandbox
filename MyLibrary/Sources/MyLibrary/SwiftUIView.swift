import APIClient
import SwiftUI

public struct SwiftUIView: View {
    public init() {}
    public var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(
                action: {
                    APIClient.shared.methodDependent()
                },
                label: {
                    Text("methodDependent")
                })

            Button(
                action: {
                    APIClient.shared.httpBody()
                },
                label: {
                    Text("httpBody")
                })
            Button(
                action: {
                    APIClient.shared.queryString()
                },
                label: {
                    Text("queryString")
                })
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
