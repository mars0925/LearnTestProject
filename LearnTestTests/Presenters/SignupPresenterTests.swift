//
//  SignupPresenterTests.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/4/12.
//

import XCTest
@testable import LearnTest
final class SignupPresenterTests: XCTestCase {
    var signupForModel:SignupForModel!
    var mockSignupModelValidator:MockSignupModelValidator!
    var mockSignupWebService:MockSignupWebService!
    var sut:SignupPresenter!
    var mockSignupViewDelegate:MockSignupViewDelegate!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        signupForModel = SignupForModel(unid: "mars999", pwd: "a123456", role: "patient", firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678", reapPassword: "12345678")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator:mockSignupModelValidator, signupService: mockSignupWebService,delegate:mockSignupViewDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupForModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        mockSignupViewDelegate = nil
    }
    
    func testSignupPresenter_WhenInfomationProvided_WillValidateEachProperty(){
        //arrange
//        let signupForModel = SignupForModel(unid: "mars999", pwd: "a123456", role: "patient", firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678", reapPassword: "12345678")
//        let mockSignupModelValidator = MockSignupModelValidator()
//        let MockSignupWebService = MockSignupWebService()
//        let sut = SignupPresenter(formModelValidator:mockSignupModelValidator, signupService: MockSignupWebService)
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
//        let signupForModel = SignupForModel(unid: "mars999", pwd: "a123456", role: "patient", firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678", reapPassword: "12345678")
//        let mockSignupModelValidator = MockSignupModelValidator()
//        let MockSignupWebService = MockSignupWebService()
//        let sut = SignupPresenter(formModelValidator:mockSignupModelValidator, signupService: MockSignupWebService)
        
        //act
        sut.processUserSignup(formModel: signupForModel)
        //assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "the signup() method not call")
        
    }

    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSucessOnViewDelegate(){
        //arrage
        let myExpectation = expectation(description: "expected the successfulSignUP() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        
        //act
        sut.processUserSignup(formModel: signupForModel)
        self.wait(for: [myExpectation],timeout: 5)
        //assert
    }

}
