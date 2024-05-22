//
//  LearnTestUITests.swift
//  LearnTestUITests
//
//  Created by 張宮豪 on 2024/3/26.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    private var app:XCUIApplication!
    private var firstName:XCUIElement!
    private var lastName:XCUIElement!
    private var email:XCUIElement!
    private var password:XCUIElement!
    private var repeatPassword:XCUIElement!
    private var signUpButton:XCUIElement!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signUpButton = app.buttons["signupButton"]

        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signUpButton = nil
        try super.tearDownWithError()
    }

    //SignupViewController loaded 元素都是enable狀態
    func testSignupViewController_WhenViewLoaded_RequireUIElementsAreEnable() throws {
        // UI tests must launch the application that they test.

  
        
        XCTAssertTrue(firstName.isEnabled,"firstName is not enable")
        XCTAssertTrue(lastName.isEnabled,"lastName is not enable")
        XCTAssertTrue(email.isEnabled,"email is not enable")
        XCTAssertTrue(password.isEnabled,"password is not enable")
        XCTAssertTrue(repeatPassword.isEnabled,"repeatPassword is not enable")
        XCTAssertTrue(signUpButton.isEnabled,"signUpButton is not enable")

    }
    
    //表格提交有錯誤，顯示錯誤提示窗
    func testSignUpController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog(){

        firstName.tap()
        firstName.typeText("S")
        
        lastName.tap()
        lastName.typeText("K")
        
        email.tap()
        email.typeText("12345")
        
        password.tap()
        password.typeText("11111")
        
        repeatPassword.tap()
        repeatPassword.typeText("1111133")
        
        signUpButton.tap()
        
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "an error alert dialog is not presented when invalid signup form")
    }
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
