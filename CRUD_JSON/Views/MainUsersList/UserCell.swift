//
// Created by agmcoder on 25/9/22.
//

import Foundation
import SwiftUI

//user cell with name and birthdate

struct UserCell: View {
    var prop: Properties
    var user: User
    var body: some View {
        VStack(
                content: {

                    HStack {
                        if let name = user.name {
                            CustomText(text: name ,prop: prop)
                        } else {
                            CustomText(text: "", prop: prop)
                        }

                        Image("cake")
                                .resizable()
                                .frame(
                                        width: prop.size.height,
                                        height: prop.size.height
                                )
                                .scaledToFit()

                        if (user.birthdate != nil), let date = user.birthdate {
                            Text(dateManager(date: date))
                                    .font(.headline)
                                    .padding()
                        }
                    }

                }
        )
    }

}


struct CustomText:View {
    var text: String
    var prop: Properties
    var body: some View {
        Text(text)
                .frame(width: prop.size.width * 0.3, height: prop.size.height * 0.1)
                .font(.headline)
                .padding()
                .fixedSize()
    }
}

//preview UserCell

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(
                prop: Properties(isLandscape: true, isiPad: true, size: CGSize(width: 400, height: 50)),
                user: User(name: "nombre", birthdate: Date(), id: 2)
        )
    }
}


