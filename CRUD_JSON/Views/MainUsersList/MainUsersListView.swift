//
//  MainUsersListView.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import SwiftUI

struct MainUsersListView: View {
    @ObservedObject var usersListVM: UsersListViewModel
    let prop: Properties
    var body: some View {
        UsersListView(usersListVM: usersListVM, prop: prop)


    }
}

// UsersListView

// List of users showing the name and birthdate
struct UsersListView: View {
    @ObservedObject var usersListVM: UsersListViewModel
    let prop: Properties
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                        columns: [GridItem(.adaptive(minimum: prop.size.width*0.4, maximum: prop.size.width*0.5))],
                spacing: 15
                ) {
                    ForEach(usersListVM.users) { user in
                        NavigationLink(
                            destination: UserDetailsView(user: user, userDetailsVM: UserDetailsViewModel())
                        ) {
                            UserCell(prop: prop, user: user)
                        }

                    }
                }
            }
                    
        }
        
        
    }
}


// MARK: Preview

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView(usersListVM: UsersListViewModel(), prop: Properties(isLandscape: true, isiPad: true, size: CGSize(width: 300, height: 500)))
    }
}


