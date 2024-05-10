//
//  LoginWithThrowErrorUnitTestTests.swift
//  LearnTestTests
//
//  Created by 張宮豪 on 2024/5/10.
//

import XCTest
@testable import LearnTest
/// unit test 如何 throw error
final class LoginWithThrowErrorUnitTestTests: XCTestCase {
    var sut:LoginValidator!

    override func setUpWithError() throws {
        sut = LoginValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    //first name 出現無效字元時丟出error
    func testFirstNameValidation_WhenInValidCharactersProvide_throwError(){
        //arrange
//        let sut = LoginValidator()
        //act and assert
        //測試是否正確丟出預期的Error類型
        XCTAssertThrowsError(try sut.isFirstNameValid("1*"), "isFirstNameValid() should throw Error when first name contains illigal characters "){ (errorThrown) in
            
            XCTAssertEqual(errorThrown as? LoginError, LoginError.illigalCharactersFound)
        }
        //另一種用do catch 的檢查方法
        do {
            let _ = try sut.isFirstNameValid("1*")
            XCTFail("isFirstNameValid 應該丟出錯誤 這邊不該執行")
        } catch (let error ){
            //應該收到預期中的錯誤
            XCTAssertEqual(error as? LoginError, LoginError.illigalCharactersFound)
        }
        
    }
    
    //有效字元不應該丟出錯誤
    func testFirstNameValidation_WhenValidCharactersProvided_NotthrowError(){
        let firstName = "sherry"
        XCTAssertNoThrow(try sut.isFirstNameValid(firstName),"不應該丟出錯誤")
        XCTAssertTrue(try sut.isFirstNameValid(firstName),"應該是返回true值")
    }

}
