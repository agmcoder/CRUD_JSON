//
//  UsersListView.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import SwiftUI

struct MainUsersListView: View {
    @ObservedObject var usersListVM : UsersListViewModel
    var body: some View {
        UsersListView(usersListVM: usersListVM)
                .navigationBarTitle("Users")
                //toolbar with add user button
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {

                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    //add user
                                    print("add user")
                                }
                    }
                }

    }
}
// UsersListView
// List of users showing the name and birthdate
struct UsersListView: View {
    @ObservedObject var usersListVM :UsersListViewModel

    var body: some View {
            List(usersListVM.users) { user in
                    UserCell(user: user)
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView(usersListVM: UsersListViewModel())
    }
}
