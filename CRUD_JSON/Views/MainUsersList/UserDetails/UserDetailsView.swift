//
// Created by agmcoder on 27/9/22.
//

import Foundation
import SwiftUI
//struct with users details
struct UserDetailsView: View {
    private var user: User
    @ObservedObject var userDetailsVM: UserDetailsViewModel
    init(user:User,userDetailsVM: UserDetailsViewModel) {
        self.userDetailsVM = userDetailsVM
        userDetailsVM.setValues(user: user)
        self.user = user
    }

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(){
                Text("Name: ")
                TextField("Name", text: $userDetailsVM.nameTextFieldText)
            }
            HStack(){
                DatePicker("Birthdate", selection: $userDetailsVM.birthdateValue,  displayedComponents: .date)
            }
            
            HStack(){
                if let id = userDetailsVM.idValue {
                    Text("ID: \(id)")
                } else {
                    Text("ID: ")
                }
            }
            Button(
                action: {
                    task{
                        await userDetailsVM.updateUser(user: user)
                    }
            }
                   , label: {
                Text("Update")
                   })
            .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.bordered)
        }
        .padding(.horizontal)
    }
}

//preview
struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: User(name: "juan cuesta", birthdate: Date(), id: 6768), userDetailsVM: UserDetailsViewModel())
    }
}
