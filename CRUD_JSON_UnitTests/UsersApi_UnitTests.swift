//
//  UsersApi_UnitTests.swift
//  CRUD_JSON_UnitTests
//
//  Created by agmcoder on 27/9/22.
//

import XCTest
@testable import CRUD_JSON

final class UsersApi_UnitTests: XCTestCase {

     var userApi : UserApi = UserApi()
    override func setUp() async throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchUsers() async throws{
        if let users = try await userApi.fetchUsers(){
            XCTAssertTrue(users.count > 40)
        }
    }
    
    func testDeleteUser() async throws {
        if let users = try await userApi.fetchUsers(){
            XCTAssertTrue(users.contains(where: {$0.id == 6693}))
        }
        await userApi.deleteUser(id: 6693)
        if let users = try await userApi.fetchUsers(){
            XCTAssertFalse(users.contains(where: {$0.id == 6693}))
        }
    }

}
