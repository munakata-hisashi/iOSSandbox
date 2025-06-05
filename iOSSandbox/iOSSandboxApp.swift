//
//  iOSSandboxApp.swift
//  iOSSandbox
//
//  Created by 宗像恒 on 2023/03/04.
//

import SwiftUI
import TipKit

@main
struct iOSSandboxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        do {
            if #available(iOS 17.0, *) {
                try Tips.configure()
            } else {
                // Fallback on earlier versions
            }
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
