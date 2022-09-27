//
// Created by agmcoder on 27/9/22.
//

import Foundation
import SwiftUI
//struct with users details
struct UserDetails: View {
    let user: User

    var body: some View {
        VStack {
            Text("Name: \(user.name ?? "No name")")
            Text("Birthdate: \(user.birthdate ?? Date(), formatter: DateFormatter())")
            if let id = user.id {
                Text("ID: \(id)")
            }
        }
    }
}
