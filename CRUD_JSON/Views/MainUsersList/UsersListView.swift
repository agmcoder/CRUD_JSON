//
//  UsersListView.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import SwiftUI

struct MainUsersListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
// UsersListView
// List of users showing the name and birthdate
struct UsersListView: View {
    @ObservedObject var usersListVM = UsersListViewModel()

    var body: some View {
        NavigationView {
            List(self.usersListVM.users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    UserCell(user: user)
                }
            }
            .navigationBarTitle("Users")
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
