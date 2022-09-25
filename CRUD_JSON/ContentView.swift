//
//  ContentView.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainUsersListView(usersListVM: UsersListViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
