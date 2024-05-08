//
//  MockSignupViewDelegate.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/4/18.
//

import Foundation
import XCTest
@testable import LearnTest

class MockSignupViewDelegate:SignupViewDelegategateProtocol {
    var expectation:XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHanlderCounter = 0
    var signupError:SignupError?
    func successfullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: LearnTest.SignupError) {
        signupError = error
        errorHanlderCounter += 1
        expectation?.fulfill()
    }

    
}
