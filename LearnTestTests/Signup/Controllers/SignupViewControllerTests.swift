//
//  SignupViewControllerTests.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/5/8.
//

import XCTest
@testable import LearnTest

final class SignupViewControllerTests: XCTestCase {
    var storyboard:UIStoryboard!
    var sut:SignupViewController!

    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        storyboard = nil
        sut = nil
    }
    ///SignupViewController 初始化時TextField不是空白
    func testSignupViewController_WhenCreated_hasRequiredTextFieldsEmpty() throws{
        //檢查元件有沒有連接到storyboad
        let firstNameTextField = try XCTUnwrap(sut.userFirstNameTextField,"firstNameTextField not connect to IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField,"lastNameTextField not connect to IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField,"emailTextField not connect to IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField,"passwordTextField not connect to IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField,"repeatPasswordTextField not connect to IBOutlet")
       
        XCTAssertEqual(firstNameTextField.text, "", "first name not empty")
        XCTAssertEqual(lastNameTextField.text, "", "last name not empty")
        XCTAssertEqual(emailTextField.text, "", "email name not empty")
        XCTAssertEqual(passwordTextField.text, "", "password name not empty")
        XCTAssertEqual(repeatPasswordTextField.text, "", "repeat password name not empty")
        
    }
    ///SignupViewController 初始化時有註冊按鈕
    func testSignupViewController_WhenCreated_hasSignupButtonAndAction() throws{
        let signupButton = try XCTUnwrap(sut.signupButton,"signupButton not connect to IBOutlet")
        let signupButtonActions =  try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside),"sign up button not have any actions assigned to it")
        
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "tap:", "這個按鈕沒有叫做tap:的action")
    }
    
    ///註冊按鈕是否呼叫 SignupProcess()
    func testSignupViewController_WhenSignupButtonTapped_InvokesSignupProcess(){
        //arrange
        let mockSignupModelValidator =  MockSignupModelValidator()
        let mockSignupWebService =  MockSignupWebService()
        let mockSignupViewDelegate =  MockSignupViewDelegate()
        
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, signupService: mockSignupWebService, delegate: mockSignupViewDelegate)
        sut.signupPresenter = mockSignupPresenter // injet mock  SignupPresenter
        //act
        sut.signupButton.sendActions(for: .touchUpInside) //送出action
        //assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "the processUserSignup method was not called on a presenter object when the signup button was tapped")
    }
}
