//
//  File.swift
//  
//
//  Created by 宗像恒 on 2023/03/18.
//

import Foundation
import SwiftUI
import UIKit

struct UIKitSandboxViewController: UIViewControllerRepresentable {
    // 1. 利用したいViewControllerにエイリアスをつける（もちろんつけずに下記コードで都度書いてもいい）
    typealias UIViewControllerType = UINavigationController

    // 2. 必須のメソッド。作成したいViewControllerを返すメソッドを実装する
    func makeUIViewController(context: Context) -> UIViewControllerType {
        UINavigationController(rootViewController: SandboxViewController())
    }

    // 3. 必須のメソッド。Viewが更新された場合に必要な処理を実装する
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }

    // 4. Coordinatorのファクトリーメソッドを実装する。
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    // 5. Coordinatorを定義する
    class Coordinator {

    }
}
