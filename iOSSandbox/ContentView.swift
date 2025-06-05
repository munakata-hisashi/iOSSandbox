import SwiftUI
import MyLibrary
import TipKit

struct ContentView: View {
    var body: some View {
        TabView {
            SwiftUIView()
                .showTip()
                .tabItem {
                    if #available(iOS 17.0, *) {
                        Text("SwiftUI")
                            .popoverTip(SampleTip())
                    } else {
                        Text("SwiftUI")
                    }
                }
                
            UIKitView()
                .tabItem {
                    Text("UIKit")
                }
        }
    }
}

extension View {
    func showTip() -> some View {
        if #available(iOS 17.0, *) {
            return self.popoverTip(SampleTip())
        } else {
            return self
        }
    }
}

@available(iOS 17.0, *)
struct SampleTip: Tip {
    var title: Text {
        Text("タイトル")
    }
    
    var message: Text? {
        Text("メッセージ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


