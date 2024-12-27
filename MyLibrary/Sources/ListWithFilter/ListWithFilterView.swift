import SwiftUI

public struct ListWithFilterView: View {
    public init() { }
    public var body: some View {
        List(UserData.users) { user in
            Text("\(user.id.uuidString)")
            
        }
    }
}

#Preview {
    ListWithFilterView()
}
