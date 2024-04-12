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
        let signupForModel = SignupForModel(unid: "mars999", pwd: "a123456", role: "patient")
        
        let mockSignupModelValidator = MockSignupModelValidator()
        let sut = SignupPresenter()
        //act
        sut.processUserSignup(formModel: signupForModel)
        //assert
        XCTAssertTrue(mockSignupModelValidator.isFirsNameValidated)
    }


}
