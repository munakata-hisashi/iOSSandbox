//
//  AFSampleView.swift
//  MyLibrary
//
//  Created by 宗像恒 on 2025/03/11.
//

import SwiftUI

public struct AFSampleView: View {
    public init() { }
    public var body: some View {
        VStack {
            Button(
                action: {
                    APIClient.shared.login()
                },
                label: {
                    Text("login")
                }
            )
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
