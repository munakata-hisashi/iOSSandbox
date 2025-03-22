//
//  TempView.swift
//  MyLibrary
//
//  Created by 宗像恒 on 2025/03/15.
//
import SwiftUI

/// https://developer.apple.com/documentation/swiftui/shape/trim(from:to:) のサンプルコード
struct TrimSampleView: View {
    var body: some View {
        Path { path in
            path.addLines([
                .init(x: 2, y: 1),
                .init(x: 1, y: 0),
                .init(x: 0, y: 1),
                .init(x: 1, y: 2),
                .init(x: 3, y: 0),
                .init(x: 4, y: 1),
                .init(x: 3, y: 2),
                .init(x: 2, y: 1)
            ])
        }
        .trim(from: 0.25, to: 1.0)
        .scale(50, anchor: .topLeading)
        .stroke(Color.black, lineWidth: 3)
    }
}

#Preview {
    TrimSampleView()
}
