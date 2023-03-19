//
//  ContentView.swift
//  iOSSandbox
//
//  Created by 宗像恒 on 2023/03/04.
//

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
