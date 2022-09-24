//
// Created by agmcoder on 24/9/22.
//

import Foundation
import SwiftUI

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let birthdate: Date
}