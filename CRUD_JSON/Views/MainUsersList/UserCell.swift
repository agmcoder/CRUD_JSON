//
// Created by agmcoder on 25/9/22.
//

import Foundation
import SwiftUI

//user cell with name and birthdate

struct UserCell: View {
    var user: User
    var body: some View {
        VStack(
                alignment: .leading,
                content: {
                    ZStack{
                        Rectangle().frame(width: .infinity,height: 50)
                            .background(Color.gray)
                            .opacity(0.1)
                        HStack {
                            
                            Text(user.name)
                                .font(.headline)
                                .padding()
                            Spacer()
                            Image("cake")
                                .resizable()
                                .frame(width: 50,height: 50)
                            Text(dateManager(date: user.birthdate))
                                .font(.subheadline)
                                .padding()
                            Spacer()
                        }
                        .frame(width: .infinity)
                        
                    }
                    
                }
        )
            
        
    }

}

//preview UserCell

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: User(id: 1, name: "camcorder", birthdate: Date()))
    }
}

