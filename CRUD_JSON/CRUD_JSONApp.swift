//
//  CRUD_JSONApp.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import SwiftUI

@main
struct CRUD_JSONApp: App {
    private let usersListVM = UsersListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(usersListVM: usersListVM)
                    .task{
                         await  usersListVM.fetchUsers()
                    }
        }
    }
}
