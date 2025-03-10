import APIClient
import Component
import ListWithFilter
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
                    AppPath.uiSamples.viewTitle, value: AppPath.uiSamples
                )
                NavigationLink(
                    AppPath.cutoutShape.viewTitle, value: AppPath.cutoutShape
                )
                NavigationLink(
                    AppPath.additionalListAndFilter.viewTitle,
                    value: AppPath.additionalListAndFilter
                )
                NavigationLink(
                    AppPath.alamofireSample.viewTitle, value: AppPath.alamofireSample
                )
            }
            .navigationTitle("ホーム")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(
                for: AppPath.self,
                destination: { appended in
                    appended.destination()
                        .navigationTitle(appended.viewTitle)
                        .navigationBarTitleDisplayMode(.inline)
                }
            )
        }
    }
}

/// 画面を追加するときはここにcaseを足す
enum AppPath: Int {
    case uiSamples, cutoutShape, additionalListAndFilter, alamofireSample

    var viewTitle: String {
        switch self {
        case .uiSamples:
            "SwiftUI素振り"
        case .cutoutShape:
            "図形をかく"
        case .additionalListAndFilter:
            "無限スクロールでの追加読み込みとフィルタ"
        case .alamofireSample:
            "Alamofireサンプル"
        }
    }

    @ViewBuilder
    func destination() -> some View {
        switch self {
        case .uiSamples:
            UISamplesView()
        case .cutoutShape:
            CutoutShape(
                width: 300, height: 100, cutoutRadius: 50, cornerRadius: 10
            )
            .stroke()
            .fill(Color.blue)
            .frame(width: 300, height: 100)
        case .additionalListAndFilter:
            ListWithFilterView()
        case .alamofireSample:
            AFSampleView()
        }
    }
}
