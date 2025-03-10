//
//  UISamplesView.swift
//  MyLibrary
//
//  Created by 宗像恒 on 2025/03/11.
//

import SwiftUI

public struct UISamplesView: View {
    public init() { }
    public var body: some View {
        List(themes) { theme in
            NavigationLink(theme.label, destination: { CountdownView() })
        }
    }
}

let themes: [SampleTheme] = [
    .init(id: 1, title: "CountdownView")
]

struct SampleTheme: Identifiable {
    let id: Int
    let title: String
    
    var label: String {
        "\(id): \(title)"
    }
}
