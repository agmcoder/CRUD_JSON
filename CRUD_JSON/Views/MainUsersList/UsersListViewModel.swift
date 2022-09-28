//
// Created by agmcoder on 24/9/22.
//

import Foundation

// MARK: - viewModel of UsersList
class UsersListViewModel: ObservableObject {
    @Published var users = [User]()
    private var userApi : UserApi = UserApi()
    private var isLoadingUsers = true





    // MARK: - functions
    func fetchUsers() async  {
            do {
                let users = try await userApi.fetchUsers() ?? []
                DispatchQueue.main.async {
                    self.users = users
                    self.isLoadingUsers = false
                }
            } catch {
                print(error)
            }
    }

    func callDeleteUser(index: IndexSet) async  {
        await deleteUser(index: index)
    }
    func deleteUser(index: IndexSet) async {
        if let id: Int = users[index.first!].id{
            await userApi.deleteUser(id: id)
            users.remove(atOffsets: index)
        }
    }


}
