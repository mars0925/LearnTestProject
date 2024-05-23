//
//  LoginFlowUITests.swift
//  LearnTestUITests
//
//  Created by 張宮豪 on 2024/5/23.
//

import XCTest

final class LoginFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateAccontButton_WhenTapped_PresentSecondController() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.buttons["pushNextViewController"].tap()
        XCTAssertTrue( app.otherElements["SecondViewController"].waitForExistence(timeout: 2),"沒有出現 SecondViewController")
       

       
    }

}
