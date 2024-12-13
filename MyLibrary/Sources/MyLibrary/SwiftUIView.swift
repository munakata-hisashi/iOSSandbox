import APIClient
import SwiftUI

public struct SwiftUIView: View {
    public init() {}
    public var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

struct CutoutShape: Shape {
    let width: CGFloat
    let height: CGFloat
    let cutoutRadius: CGFloat
    let cornerRadius: CGFloat // 角を丸くするための半径を追加

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 図形の開始点（左上の角を丸くするために調整）
        path.move(to: CGPoint(x: 0, y: cornerRadius))
        
        
        // 左上の角を丸くする
        path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0), control: CGPoint(x: 0, y: 0))
        
        // 左上から半円の左端までの線
        path.addLine(to: CGPoint(x: width / 2 - cutoutRadius - 15, y: 0))
        
        // xで+2しないと線が繋がらない
        let to = CGPoint(x: width / 2 - cutoutRadius + 2, y: 15)
        let c = CGPoint(x: width / 2 - cutoutRadius, y: 0)
        path.addQuadCurve(to: to, control: c)
        // 半円をくり抜くためのパス
        path.addArc(center: CGPoint(x: width / 2, y: 0),
                    radius: cutoutRadius,
                    startAngle: Angle(degrees: 160),
                    endAngle: Angle(degrees: 20),
                    clockwise: true)
        
        let to2 = CGPoint(x: width / 2 + cutoutRadius + 15, y: 0)
        let c2 = CGPoint(x: width / 2 + cutoutRadius, y: 0)
        path.addQuadCurve(to: to2, control: c2)

        path.addLine(to: CGPoint(x: width - cornerRadius, y: 0))
        // 右上の角を丸くする
        path.addQuadCurve(to: CGPoint(x: width, y: cornerRadius), control: CGPoint(x: width, y: 0))
        
        // 右上から右下への線
        path.addLine(to: CGPoint(x: width, y: height - cornerRadius))
        
        // 右下の角を丸くする
        path.addQuadCurve(to: CGPoint(x: width - cornerRadius, y: height), control: CGPoint(x: width, y: height))
        
        // 右下から左下への線
        path.addLine(to: CGPoint(x: cornerRadius, y: height))
        
        
        // 左下の角を丸くする
        path.addQuadCurve(to: CGPoint(x: 0, y: height - cornerRadius), control: CGPoint(x: 0, y: height))
        
        // 左の線（先頭に戻る）
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))


        return path
    }
}

