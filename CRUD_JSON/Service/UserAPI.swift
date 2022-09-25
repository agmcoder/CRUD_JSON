//
//  UserAPI.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import Foundation

protocol UserApiProtocol {
    static func fetchUsers() async throws -> [User]?
    static func createUser(user: User) async throws
    static func updateUser(user: User) async throws
    static func deleteUser(user: User) async throws

}

class UserApi: UserApiProtocol {

    static func fetchUsers() async throws -> [User]? {
        let endPoint = EndPoint.users.rawValue
        guard let url = URL(string: endPoint) else {
            print("Invalid URL")

            return nil
        }
        let urlRequest = URLRequest(url: url)
        do {
            let (json, _) = try await URLSession.shared.data(for: urlRequest)

            if let decodedResponse = try? JSONDecoder().decode([User].self, from: json) {
                return decodedResponse
            }
        } catch {
            print("Invalid data")
        }
        return nil

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

//json of users

class UserApiMock: UserApiProtocol {
    private static let delay: Int = 3

    static func fetchUsers() async throws -> [User] {
        let url = URL(string:)
    }

    static func createUser(user: User) async throws {
        <#code#>
    }

    static func updateUser(user: User) async throws {
        <#code#>
    }

    static func deleteUser(user: User) async throws {
        <#code#>
    }

    private static let users = """
                               [
                                   {
                                       "id": 1,
                                       "name": "John",
                                       "birthdate": "1990-01-01T00:00:00.000Z"
                                   },
                                   {
                                       "id": 2,
                                       "name": "Jane",
                                       "birthdate": "1990-01-01T00:00:00.000Z"
                                   },
                                   {
                                       "id": 3,
                                       "name": "Jack",
                                       "birthdate": "1990-01-01T00:00:00.000Z"
                                   }
                               ]
                               """
}







