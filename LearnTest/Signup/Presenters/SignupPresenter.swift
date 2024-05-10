//
//  SignupPresenter.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/4/12.
//

import Foundation

class SignupPresenter:SignupPresenterProtocol {
    private var formModelValidator:SignupModelValidatorProtocol
    private var signupService:SignupWebServiceProtocol
    private weak var delegate:SignupViewDelegategateProtocol?

    //注入驗證的類別，可以注入測試用的假類別
    required init(formModelValidator:SignupModelValidatorProtocol ,signupService:SignupWebServiceProtocol,delegate:SignupViewDelegategateProtocol) {
        self.formModelValidator = formModelValidator
        self.signupService = signupService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel signupForModel:SignupForModel){
        
        if !formModelValidator.isFirstNameValid(firstName: signupForModel.firstName){
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: signupForModel.lastName){
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: signupForModel.email){
            return
        }
        
        if !formModelValidator.isPasswordValid(password: signupForModel.password){
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: signupForModel.password, repeatPassword: signupForModel.reapPassword){
            return
        }
        
        signupService.signup(signupModel: signupForModel) { [weak self ] loginResult, error in
            
            
            guard let _ = loginResult,
                  error == nil else {
                self?.delegate?.errorHandler(error: error!)
               return
            }
            
            self?.delegate?.successfullSignup()
        }
        
    }
}
