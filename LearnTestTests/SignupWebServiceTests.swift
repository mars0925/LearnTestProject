//
//  SignupWebServiceTests.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/3/28.
//

import XCTest
//@testable import LearnTest
@testable import LearnTest

final class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testSignupWebservice_WhenGiveSuccessfullResponse_ReturnSuccess(){
        //Arrange
        let sut = SignupWebService()
        let signModel = SignupModel(unid: "mars999", pwd: "a123456", role: "pacient")
        let expectation = self.expectation(description: "Signup web servcie response expectation")
        //act
        sut.signup(signupModel: signModel){ (loginResult, error) in
            //assert
            XCTAssertEqual(loginResult?.code, 1)
            expectation.fulfill()//expectation在時間內要完成 否則失敗
        }
        self.wait(for: [expectation],timeout: 5)
    }


}
