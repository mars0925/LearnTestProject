//
//  SignupPresenterProtocol.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/5/9.
//

import Foundation

protocol SignupPresenterProtocol:AnyObject {
    
    init(formModelValidator:SignupModelValidatorProtocol ,signupService:SignupWebServiceProtocol,delegate:SignupViewDelegategateProtocol)
    
    func processUserSignup(formModel signupForModel:SignupForModel)
    
}
