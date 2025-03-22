//
//  UISamplesView.swift
//  MyLibrary
//
//  Created by 宗像恒 on 2025/03/11.
//

import SwiftUI

public struct UISamplesView: View {
    let themes: [SampleTheme] = SampleTheme.allCases
    public init() { }
    public var body: some View {
        List(themes) { theme in
            NavigationLink(destination: { theme.view }, label: { Text("\(theme.id)")})
        }
    }
}

enum SampleTheme:String, Identifiable, CaseIterable {
    case Countdown
    case TrimSample
    
    var id: String {
        self.rawValue
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .Countdown:
            CountdownView()
        case .TrimSample:
            TrimSampleView()
        }
    }
}
