import Component
import SwiftUI

public struct SwiftUIView: View {
    public init() {}

    let width: CGFloat = 300
    let height: CGFloat = 100
    let cutoutRadius: CGFloat = 50

    @State var path = NavigationPath()

    public var body: some View {
        NavigationStack(path: $path) {
            VStack {
                NavigationLink(
                    AppPath.cutoutShape.viewTitle, value: AppPath.cutoutShape)
                NavigationLink(
                    AppPath.additionalListAndFilter.viewTitle,
                    value: AppPath.additionalListAndFilter)
            }
            .navigationTitle("ホーム")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(
                for: AppPath.self,
                destination: { appended in
                    appended.destination()
                        .navigationTitle(appended.viewTitle)
                        .navigationBarTitleDisplayMode(.inline)
                })
        }
    }
}

/// 画面を追加するときはここにcaseを足す
enum AppPath: Int {
    case cutoutShape, additionalListAndFilter

    var viewTitle: String {
        switch self {
        case .cutoutShape:
            "図形をかく"
        case .additionalListAndFilter:
            "無限スクロールでの追加読み込みとフィルタ"
        }
    }

    @ViewBuilder
    func destination() -> some View {
        switch self {
        case .cutoutShape:
            CutoutShape(
                width: 300, height: 100, cutoutRadius: 50, cornerRadius: 10
            )
            .stroke()
            .fill(Color.blue)
            .frame(width: 300, height: 100)
        case .additionalListAndFilter:
            Text("list")
        }
    }
}
