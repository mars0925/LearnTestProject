//
//  TestingViewControlNavigation.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/5/21.
//

import XCTest
@testable import LearnTest

final class TestingViewControlNavigation: XCTestCase {
    var sut:SignupViewController!
    var navigationController:UINavigationController!
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }
    
    ///點擊按鈕時要push SecondViewController
    func testNextViewButton_WhenTapped_SecondViewControllerIsPussh(){
        //觸發事件後第一個ViewController要是SecondViewController
        let myPredicate = NSPredicate { input, _ in
            //滿足的條件：觸發事件後第一個ViewController要是SecondViewController
            return (input as? UINavigationController)?.topViewController is SecondViewController
        }
        //以navigationController來測試條件
        expectation(for: myPredicate, evaluatedWith: navigationController)
        sut.nextPageButton.sendActions(for: .touchUpInside)//觸發按鈕事件
        
        //Wait for the expectation to be fulfilled within 2 seconds
        waitForExpectations(timeout: 2)
        
    }
    
    func testNextViewButton_WhenTapped_SecondViewControllerIsPush_V3(){
        let spyNavigationController = SpyNavigationController(rootViewController: sut)
        sut.nextPageButton.sendActions(for: .touchUpInside)
        
        guard let _ = spyNavigationController.pushedViewController as? SecondViewController else {
            XCTFail()
            return
        }
    }
}
