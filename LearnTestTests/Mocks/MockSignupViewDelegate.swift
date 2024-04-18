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
    func successfullSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: LearnTest.SignupError) {
        
    }

    
}
