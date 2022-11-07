//
//  NetworkModelTest.swift
//  0-DragonBallAppTests
//
//  Created by Aitor Iglesias Pubill on 5/11/22.
//

import XCTest

@testable import __DragonBallApp

final class NetworkModelTest: XCTestCase {

    private var sut: NetworkModel!
    
    override func setUpWithError() throws {
        sut = NetworkModel()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    
    //FUNCION TEST LOGIN SUCCESS
    func testLoginSuccess() throws {
        let expectation = expectation(description: "Login Success")
        var retrievedToken: String?
        var error: NetworkError?
        
        sut.login(user: "aiglesiaspubill@gmail.com", password: "19871989aA") { token , networkError in
            retrievedToken = token
            error = networkError
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        
        XCTAssertNotNil(retrievedToken, "should have received a token")
        XCTAssertNil(error, "should be no error")
        
    }
    
    //FUNCION TEST LOGIN FAIL
    func testLoginFail() throws {
        let expectation = expectation(description: "Login Fail")
        var retrievedToken: String?
        var error: NetworkError?
        
        sut.login(user: "aiglesiaspubill@gmail.com", password: "19871") { token , networkError in
            retrievedToken = token
            error = networkError
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        
        XCTAssertNil(retrievedToken, "should have not received a token")
        XCTAssertNotNil(error, "should be an error")
        
    }
    
    
    //TODO: 
    //FUNCION TEST GET HEROES OKEY
    func testGetHeroesSuccess() throws {
        let expectation = expectation(description: "Get Heroes Success")
        var heroes: [Hero]?
        var error: NetworkError?
        
        sut.getHeroes { listHeroes, networkError in
            heroes = listHeroes
            error = networkError
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        
        XCTAssertNotNil(heroes, "should have received a list of heroes")
        XCTAssertNil(error, "should be no error")
    }

}
