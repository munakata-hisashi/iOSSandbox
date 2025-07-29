import APIClient
import Component
import ListWithFilter
import SwiftUI

public struct SwiftUIView: View {
    public init() {}

    let width: CGFloat = 300
    let height: CGFloat = 100
    let cutoutRadius: CGFloat = 50
    let contents: [AppPath] = AppPath.allCases

    @State var path = NavigationPath()

    public var body: some View {
        NavigationStack(path: $path) {
            List(contents) { appPath in
                NavigationLink(appPath.viewTitle, value: appPath)
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
        .onChange(of: path.count) { oldValue, newValue in
            print("NavigationPath count changed: \(oldValue) -> \(newValue)")
        }
    }
}

/// 画面を追加するときはここにcaseを足す
enum AppPath: Identifiable, CaseIterable {
    var id: String {
        viewTitle
    }
    
    case uiSamples, cutoutShape, additionalListAndFilter, alamofireSample, dismissSample

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
        case .dismissSample:
            "Dismiss機能サンプル"
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
        case .dismissSample:
            DismissSampleView()
        }
    }
}
