//
//  SignUpFromModelValidator.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/3/26.
//

import Foundation

class SignUpFromModelValidator:SignupModelValidatorProtocol {
    func isLastNameValid(lastName: String) -> Bool {
        return true
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        return true
    }
    
    func isPasswordValid(password: String) -> Bool {
        return true
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return true
    }
    
    func isFirstNameValid(firstName:String)->Bool {
        return firstName.count > 2 && firstName.count < 10
    }
    
    func isMailValid(mail:String)->Bool{
        return mail.contains("@")
    }
    
    func doPasswordMatch(password:String, repeatPassword:String)->Bool {
        return password == repeatPassword
    }
    
    
}
