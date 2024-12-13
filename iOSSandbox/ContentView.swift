import SwiftUI
import MyLibrary

struct ContentView: View {
    var body: some View {
        TabView {
            SwiftUIView()
                .tabItem {
                    Text("SwiftUI")
                }
            UIKitView()
                .tabItem {
                    Text("UIKit")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


