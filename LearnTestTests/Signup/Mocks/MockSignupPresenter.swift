//
//  MockSignupPresenter.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/5/9.
//

import Foundation
@testable import LearnTest
class MockSignupPresenter:SignupPresenterProtocol {
    var processUserSignupCalled = false
    required init(formModelValidator: any LearnTest.SignupModelValidatorProtocol, signupService: any LearnTest.SignupWebServiceProtocol, delegate: any LearnTest.SignupViewDelegategateProtocol) {
        
    }
    
    func processUserSignup(formModel signupForModel: LearnTest.SignupForModel) {
        processUserSignupCalled = true
    }
}
