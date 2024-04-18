//
//  SignupViewDelegategateProtocol.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/4/18.
//

import Foundation

protocol SignupViewDelegategateProtocol:AnyObject {
    func successfullSignup()
    func errorHandler(error:SignupError)
    
}
