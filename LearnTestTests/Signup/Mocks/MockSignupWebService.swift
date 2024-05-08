//
//  MockSignupWebService.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/4/15.
//  假的註冊服務類別提供單元測試使用
import Foundation
@testable import LearnTest
class MockSignupWebService:SignupWebServiceProtocol{
    var isSignupMethodCalled = false
    var shouldReturnError = false
    
    func signup(signupModel: LearnTest.SignupForModel , completionhandler: @escaping (LearnTest.SignupResponseModel?, LearnTest.SignupError?) -> Void) {
        isSignupMethodCalled = true 
        
        if shouldReturnError {
            completionhandler(nil,SignupError.failedRequest(description: "signup request was not successful"))
        }else{
            let responseModel = SignupResponseModel(code: 1)
            completionhandler(responseModel, nil)
        }

        
    }
    
    
}
