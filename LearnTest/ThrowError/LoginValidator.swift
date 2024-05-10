//
//  LoginValidator.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/5/10.
//

import Foundation


class LoginValidator {
    // Define a set of invalid characters
    private let invalidCharacters = CharacterSet(charactersIn: "!@#$%^&*()_+-=[]{}|;:'\",.<>?/")
    
    func isFirstNameValid(_ firstName:String) throws  -> Bool {
        var returnValue = true
        
        if (firstName.rangeOfCharacter(from: invalidCharacters) != nil){
            throw LoginError.illigalCharactersFound
        }
        
        if firstName.count < 2 || firstName.count > 10 {
            returnValue = false
        }
        return returnValue
    }

}

enum LoginError :Error {
    case illigalCharactersFound
}
