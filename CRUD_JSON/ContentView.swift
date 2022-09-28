//
//  ContentView.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import SwiftUI

struct ContentView: View {
    private let usersListVM : UsersListViewModel
    init(usersListVM: UsersListViewModel) {
        self.usersListVM = usersListVM
    }
    var body: some View {
        ResponsiveView { prop in
            MainUsersListView(usersListVM: usersListVM, prop: prop)
            }

    }
}


