//
//  SignUpFromModelValidator.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/3/26.
//

import Foundation

class SignUpFromModelValidator {
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
