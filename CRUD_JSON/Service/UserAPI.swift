//
//  UserAPI.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import Foundation
// MARK: - UserAPI
struct UserAPI {
    // MARK: - functions
    // fetch users with async/await
    static func fetchUsers() async throws -> [User] {
        let url = URL(string: "https://crudcrud.com/api/8c8b5b5b5b5b5b5b5b5b5b5b5b5b5b5b/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode([User].self, from: data)
        return users
    }

    // create user with async/await
    static func createUser(user: User) async throws {
        let url = URL(string: "https://crudcrud.com/api/8c8b5b5b5b5b5b5b5b5b5b5b5b5b5b5b/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(user)
        _ = try await URLSession.shared.data(for: request)
    }

    // update user with async/await
    static func updateUser(user: User) async throws {
        let url = URL(string: "https://crudcrud.com/api/8c8b5b5b5b5b5b5b5b5b5b5b5b5b5b5b/users/\(user.id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(user)
        _ = try await URLSession.shared.data(for: request)
    }

    // delete user with async/await
    static func deleteUser(user: User) async throws {
        let url = URL(string: "https://crudcrud.com/api/8c8b5b5b5b5b5b5b5b5b5b5b5b5b5b5b/users/\(user.id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        _ = try await URLSession.shared.data(for: request)
    }
}





