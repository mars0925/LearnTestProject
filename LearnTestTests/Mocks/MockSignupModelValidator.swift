//
//  MockSignupModelValidator.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/4/12.
//

import Foundation
@testable import LearnTest

class MockSignupModelValidator:SignupModelValidatorProtocol {
    var isFirsNameValidated:Bool = false
    var isLastNameValidated:Bool = false
    var isEmailFormVlidated:Bool = false
    var isPasswordValidated:Bool = false
    var isPasswordEqualityValidated:Bool = false
    
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirsNameValidated = true
        return isFirsNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailFormVlidated = true
        return isEmailFormVlidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }

}
