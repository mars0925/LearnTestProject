//
//  SignupWebServiceProtocol.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/4/16.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(signupModel:SignupForModel,completionhandler:@escaping (SignupResponseModel?,SignupError?) -> Void)
    
}
