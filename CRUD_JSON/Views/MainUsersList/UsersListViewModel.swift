//
// Created by agmcoder on 24/9/22.
//

import Foundation

// MARK: - viewModel of UsersList
class UsersListViewModel: ObservableObject {
    @Published var users = [User]()
    private var userApi : UserApi = UserApi()

    init()  {

    }

    // MARK: - functions
    func fetchUsers() async  {
        do {
            users = try await userApi.fetchUsers() ?? []
        } catch {
            print(error)
        }
    }


}
