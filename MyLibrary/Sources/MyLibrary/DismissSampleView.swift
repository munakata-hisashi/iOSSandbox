import SwiftUI

public struct DismissSampleView: View {
    @Environment(\.dismiss) private var dismiss
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 30) {
            Text("Dismiss機能のサンプル")
                .font(.title2)
                .fontWeight(.medium)
            
            Text("下のボタンをタップすると\n前の画面に戻ります")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Button(action: {
                dismiss()
            }) {
                Text("画面を閉じる")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        DismissSampleView()
            .navigationTitle("Dismissサンプル")
            .navigationBarTitleDisplayMode(.inline)
    }
}
