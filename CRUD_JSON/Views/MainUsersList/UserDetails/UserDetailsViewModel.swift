//
//  UserDetailsViewModel.swift
//  CRUD_JSON
//
//  Created by agmcoder on 28/9/22.
//

import Foundation
class UserDetailsViewModel:ObservableObject{
    let userApi = UserApi()
    @Published var nameTextFieldText : String = ""
    @Published var birthdateValue: Date = Date()
    @Published var idValue : String = ""
    @Published var isEdited : Bool = false

    func setValues(user: User){
        if let name = user.name{
            nameTextFieldText = name
        }
        if let birthdate = user.birthdate{
            birthdateValue = birthdate
        }
        if let id = user.id{
            idValue = String(id)
        }
    }

    func updateUser(user: User) async {
        try! await userApi.updateUser(user: user)
    }

}
