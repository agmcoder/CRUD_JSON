//
// Created by agmcoder on 24/9/22.
//

import Foundation

// MARK: - viewModel of UsersList
class UsersListViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        fetchUsers()
    }

    // MARK: - functions
    // fetch users with async/await


}