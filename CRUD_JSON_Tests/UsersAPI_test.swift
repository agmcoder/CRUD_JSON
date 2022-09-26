//
//  UsersAPI_test.swift
//  CRUD_JSON_Tests
//
//  Created by agmcoder on 25/9/22.
//

import XCTest

@testable import CRUD_JSON

final class UsersApi_test: XCTestCase {
    private var userApi: UserApi!


    override func setUp() {
        super.setUp()
        userApi = UserApi()
    }

    override func tearDown() {
        userApi = nil
        super.tearDown()
    }

    func GetTest() async throws {
        if let users = try await userApi.fetchUsers(){
            XCTAssertTrue(users.contains(where: {$0.id == 6743}))
            XCTAssertFalse(users.contains(where: {$0.id == 1}))
        }

    }


    func PostTest() async throws {
        let user = User(name: "Test", birthdate: Date(), id: 1)
        try await userApi.createUser(user: user)
    }


    func DeleteTest() async throws {
        let id = 6663
        await userApi.deleteUser(id: id)
        if let users = try await userApi.fetchUsers() {
            XCTAssertFalse(users.contains(where: { $0.id == id }))
        }
    }




}
