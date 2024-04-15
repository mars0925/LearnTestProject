//
//  SignupPresenterTests.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/4/12.
//

import XCTest
@testable import LearnTest
final class SignupPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupPresenter_WhenInfomationProvided_WillValidateEachProperty(){
        //arrange
        let signupForModel = SignupForModel(unid: "mars999", pwd: "a123456", role: "patient", firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678", reapPassword: "12345678")
        
        let mockSignupModelValidator = MockSignupModelValidator()
        
        let sut = SignupPresenter(formModelValidator:mockSignupModelValidator)
        //act
        sut.processUserSignup(formModel: signupForModel)
        //assert
        XCTAssertTrue(mockSignupModelValidator.isFirsNameValidated, "first name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailFormVlidated, "email was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "password name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate if password match")
    }
    
    func testSignupPresenter_WhenGiveValidFormModel_ShouldCallSignupMethod(){
        //arrange
        let signupForModel = SignupForModel(unid: "mars999", pwd: "a123456", role: "patient", firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678", reapPassword: "12345678")
        let mockSignupModelValidator = MockSignupModelValidator()
        let MockSignupWebService = MockSignupWebService()
        
        
        //act
        let sut = SignupPresenter(formModelValidator:mockSignupModelValidator)
        sut.processUserSignup(formModel: signupForModel)
        //assert
        XCTAssertTrue(MockSignupWebService.isSignupMethodCalled, "the signup() method not call")
        
    }


}
