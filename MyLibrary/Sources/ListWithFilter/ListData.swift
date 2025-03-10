import Foundation

struct User: Identifiable {
    let id: UUID
    let name: String
}

enum UserData {
    static let users: [User] = {
        var list: [User] = []
        for i in 0..<1000 {
            list.append(User(id: .init(), name: "name\(i)"))
        }
        return list
    }()
}
