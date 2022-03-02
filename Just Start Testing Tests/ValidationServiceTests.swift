//
//  ValidationServiceTests.swift
//  Just Start Testing Tests
//
//  Created by Macintosh on 2.03.2022.
//This tests created with File > new > target > Unit Testing Bundle
//This test file is Unit Test case class file.
@testable import Just_Start_Testing
import XCTest

class ValidationServiceTests: XCTestCase {

    var validation:ValidationService!
    override func setUp() {
        super.setUp()
        validation = ValidationService()
        //it is kindo viewDidLoad
        //this function runs when every test function run
        print("setUp")
    }
    override func tearDown(){
        //For struct in every use to be new one
        validation = nil
        print("tearDown")
        super.tearDown()
    }

    func test_is_valid_username() throws {
        XCTAssertNoThrow(try validation.validateUserName("umut"))
    }
    func test_username_is_nil() throws {
        let expectedError = ValidationError.invalidValue
        var error:ValidationError?
        XCTAssertThrowsError(try validation!.validateUserName(nil)){ thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(error?.errorDescription, expectedError.errorDescription)

    }
    func test_username_is_too_long() throws{
        let expectedError = ValidationError.usernameTooLong
        var error:ValidationError?
        let userName = "Long long long long "
        XCTAssertTrue(userName.count == 20)
        XCTAssertThrowsError(try validation.validateUserName(userName)){ ThrownError in
            error = ThrownError as? ValidationError
        }
        XCTAssertEqual(error, expectedError)
        XCTAssertEqual(error?.errorDescription,expectedError.errorDescription)

    }
    func test_username_is_too_short() throws{
        let expectedError = ValidationError.usernameTooShort
        var error:ValidationError?
        XCTAssertThrowsError(try validation.validateUserName("ss")){ thrownError in
        error = thrownError as? ValidationError
        }
        XCTAssertEqual(error, expectedError)
        XCTAssertEqual(error?.errorDescription, expectedError.errorDescription)

    }
}
