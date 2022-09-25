//
// Created by agmcoder on 24/9/22.
//

import Foundation
import SwiftUI



struct User: Encodable, Identifiable, Decodable {
    let name: String?
    let birthdate: Date
    let id: Int
}
