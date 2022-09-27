//
//  MainUsersListView.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import SwiftUI

struct MainUsersListView: View {
    @ObservedObject var usersListVM: UsersListViewModel
    var body: some View {
        UsersListView(usersListVM: usersListVM)


    }
}

// UsersListView

// List of users showing the name and birthdate
struct UsersListView: View {
    @ObservedObject var usersListVM: UsersListViewModel

    var body: some View {
        NavigationView {
            List {
                //foreach with id
                ForEach(usersListVM.users, id: \.id) { user in
                    ResponsiveView { prop in
                        UserCell(prop: prop, user: user)
                    }
                }
                        .onDelete { index in
                            task{
                                await usersListVM.deleteUser(index: index)
                            }
                        }
            }

        }
                .navigationBarTitle("Users")
                .navigationBarTitleDisplayMode(.automatic)
                .refreshable {
                    await usersListVM.fetchUsers()
                }

    }


}




// MARK: Preview

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView(usersListVM: UsersListViewModel())
    }
}
