import SwiftUI
import Combine

/// https://gist.github.com/TAATHub/8f9e7d987c82ef0eea62d2e420d51144 を写経した
struct CountdownView: View {
    let countdownSeconds: Int = 10
    let numberOfDivision: Int = 36
    let handSize: CGSize = .init(width: 8, height: 24)
    let radius: CGFloat = 100
    
    @State var count: Int = 10
    @State var degree: Double = 360
    @State var timer: AnyCancellable?

    var degreeInterval: CGFloat {
        360.0 / Double(numberOfDivision)
    }

    var body: some View {
        ZStack {
            Text("\(count)")
                .font(.system(size: 60, weight: .bold))
                .contentTransition(.numericText(countsDown: true)) // This let countdown text transition downwards
                .animation(.default, value: count)
            
            ZStack {
                // 数字の真下から、数字の周りを囲うようにカプセル型のViewを配置していく
                ForEach(Array(0..<numberOfDivision), id: \.self) { angle in
                    Capsule()
                        .frame(width: handSize.width, height: handSize.height)
                        .offset(x: 0, y: 100)
                    // 0度から、350度まで10度ずつ増やす
                        .rotationEffect(.degrees(Double(angle) * degreeInterval))
                        .foregroundStyle(Color.cyan)
                }
            }
            .mask {
                Circle()
                    .trim(from: 0, to: 360 / 360) // By changing degree using withAnimation, the trim fraction also changes, creating hands animation
                    .stroke(lineWidth: handSize.height)
                    .frame(width: radius * 2, height: radius * 2)
                    .rotationEffect(.degrees(-90.0 - degreeInterval/2)) // Let hands animation start from upward (adjusted to show entire first hand)
            }
        }
        .foregroundStyle(count > 0 ? .black : .red)
        .onTapGesture {
            count = countdownSeconds
            resetTimer()
            animateRing()
            
            timer = Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { _ in
                    guard count > 0 else {
                        resetTimer()
                        return
                    }
                    
                    count -= 1
                    
                    if count > 0 {
                        animateRing()
                    }
                }
        }
    }
    
    private func resetTimer() {
        timer?.cancel()
        timer = nil
    }
    
    private func animateRing() {
        degree = 0
        withAnimation(.linear(duration: 1)) {
            degree += 360
        }
    }
}

#Preview {
    CountdownView()
}
