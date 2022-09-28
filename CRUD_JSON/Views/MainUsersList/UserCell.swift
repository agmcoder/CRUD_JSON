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
                    ZStack {
                        Rectangle()
                                .shadow(radius: 10, x: 0, y: 10)
                                .opacity(0.1)
                                .cornerRadius(30)

                        VStack {
                            if let name = user.name {
                                CustomText(text: name, prop: prop)
                            } else {
                                CustomText(text: "no name", prop: prop)
                            }

                            Image("cake")
                                    .resizable()
                                    .frame(
                                            width: prop.size.height * 0.05,
                                            height: prop.size.height * 0.05
                                    )
                                    .scaledToFit()

                            if (user.birthdate != nil), let date = user.birthdate {
                                Text(dateManager(date: date))
                                        .font(.headline)
                                        .padding()
                            }
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
                .frame(width: prop.size.width * 0.3, height: prop.size.height * 0.04)
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


