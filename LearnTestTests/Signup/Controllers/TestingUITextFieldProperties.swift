//
//  TestingUITextFieldProperties.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/5/17.
//

import XCTest
@testable import LearnTest
///測試UITextField設定的屬性
final class TestingUITextFieldProperties: XCTestCase {
    private lazy var sut:SignupViewController! = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return (storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController)
    }()

    override func setUpWithError() throws {
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testPassWordTextField_hasSecueTextEntry() throws {
        let passwordTextField = try XCTUnwrap(sut.passwordTextField , "passwordTextField is not connected")
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "passwordTextField 沒有設定 isSecureTextEntry")
    }
}
