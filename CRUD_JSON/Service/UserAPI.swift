//
//  UserAPI.swift
//  CRUD_JSON
//
//  Created by agmcoder on 24/9/22.
//

import Foundation

protocol UserApiProtocol {
    func fetchUsers() async throws -> [User]?
    //func createUser(user: User) async
    //func updateUser(user: User) async
    func deleteUser(id: Int) async

}

class UserApi: UserApiProtocol {


    func fetchUsers() async throws -> [User]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .customISO8601
        let endPoint = EndPoint.users.rawValue
        guard let url = URL(string: endPoint) else {
            print("Invalid URL")
            return nil
        }
        let urlRequest = URLRequest(url: url)
        do {
            let (json, _) = try await URLSession.shared.data(for: urlRequest)

            return try decoder.decode([User].self, from: json)
        } catch {
            print(error)
        }
        return nil

    }


    func createUser(user: User) async throws {
        guard let encoded = try? JSONEncoder().encode(user) else {
            print("Failed to encode order")
            return
        }
        guard let url = URL(string: EndPoint.users.rawValue) else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
        } catch {
            print(error)
        }
    }


    func updateUser(user: User) async throws {
        guard let encoded = try? JSONEncoder().encode(user) else {
            print("Failed to encode order")
            return
        }
        guard let url = URL(string: EndPoint.users.rawValue) else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"


        let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
        guard (response as? HTTPURLResponse)?.statusCode != 200 else {
            fatalError("Error while fetching data")
        }

        let successInfo = try JSONDecoder().decode(SuccessInfo.self, from: data)

        print(String(data: data, encoding: .utf8) ?? "default value")
        print("Success: (successInfo)")

    }

    func deleteUser(id: Int) async {
        // Delete a user with delete request
        guard let url = URL(string: EndPoint.users.rawValue + "/\(id)") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
        } catch {
            print(error)
        }
    }
}


extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601 = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = Formatter.iso8601withFractionalSeconds.date(from: string) ?? Formatter.iso8601.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}

extension Formatter {
    static let iso8601withFractionalSeconds: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return formatter
    }()
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
}
