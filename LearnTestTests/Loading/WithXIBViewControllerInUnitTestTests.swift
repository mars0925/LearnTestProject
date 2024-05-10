//
//  WithXIBViewControllerInUnitTestTests.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/5/10.
//

import XCTest
@testable import LearnTest
final class WithXIBViewControllerInUnitTestTests: XCTestCase {
    var sut:XiBBViewController!

    override func setUpWithError() throws {
        sut = XiBBViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEx(){
        
    }

}
