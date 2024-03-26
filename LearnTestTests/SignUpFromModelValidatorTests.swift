//
//  SignUpFromModelValidatorTests.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/3/26.
//

import XCTest
@testable import LearnTest
final class SignUpFromModelValidatorTests: XCTestCase {
    var sut :SignUpFromModelValidator!

    override func setUpWithError() throws {
        sut = SignUpFromModelValidator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSignformModelValid_whenValidFistNameProvided_ShouldReturnTrue(){
        //Arrange
//        let sut = SignUpFromModelValidator()
        let valid = sut.isFirstNameValid(firstName: "Mars")
        XCTAssertTrue(valid,"名字有效應該回傳true")
    }
    
    func testSignformModelValid_whenValidFistNameProvided_ShouldReturnFalse(){
        //Arrange
//        let sut = SignUpFromModelValidator()
        let valid = sut.isFirstNameValid(firstName: "s")
        XCTAssertFalse(valid,"小於兩個字應該回傳false")
    }
    
    func testSignupFormModelValidtor_whenTooLongFirstNamePrivided_shouldReturnFalse(){
        let valid = sut.isFirstNameValid(firstName: "MarsMarsMars")
        XCTAssertFalse(valid,"大於10個字應該回傳false")
    }
    
    func testFirstNameTooShort() throws {
        // Expect false for a name shorter than 3 characters
        XCTAssertFalse(sut.isFirstNameValid(firstName: "Al"))
    }
    
    func testFirstNameTooLong() throws {
        // Expect false for a name longer than 9 characters
        XCTAssertFalse(sut.isFirstNameValid(firstName: "AlexanderAlexander"))
    }
    
    func testFirstNameJustRight() throws {
        // Expect true for a name that is within the valid range
        XCTAssertTrue(sut.isFirstNameValid(firstName: "Alice"))
    }
    
    func testMailValidtor_shouldReturnTrue(){
        XCTAssertTrue(sut.isMailValid(mail: "mars@gmail"),"正確的信箱格式")
    }
    
    func testMailValidtor_shouldReturnFalse(){
        XCTAssertFalse(sut.isMailValid(mail: "1233"),"沒有＠，不正確的信箱格式")
    }
    
    func testSignupFormModelValidtor_whenEqualPasswordProvided_ShouldReturnTrue(){
        let doPasswordMatch = sut.doPasswordMatch(password:"123456789", repeatPassword:"123456789")
        XCTAssertTrue(doPasswordMatch, "密碼相同應該回傳true")
    }
    
    func testSignupFormModelValidtor_whenEqualPasswordProvided_ShouldReturnFasle(){
        let doPasswordMatch = sut.doPasswordMatch(password:"12345678", repeatPassword:"123456789")
        XCTAssertFalse(doPasswordMatch, "密碼相同應該回傳Fasle")
    }

}
