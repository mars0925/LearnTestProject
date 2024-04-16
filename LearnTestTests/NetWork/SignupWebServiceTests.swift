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
    var sut:SignupWebService!
    var signModel:SignupForModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let mockUrlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString:login_url, urlSession: mockUrlSession)
//        signModel = SignupModel(unid: "mars999", pwd: "a123456", role: "pacient")
        signModel = SignupForModel(unid: "mars999", pwd: "a123456", role: "patient", firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678", reapPassword: "12345678")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    //測試登入成功
    func testSignupWebservice_WhenGiveSuccessfullResponse_ReturnSuccess(){
        //模擬的網路請求 結果
//        let config = URLSessionConfiguration.ephemeral
//        config.protocolClasses = [MockURLProtocol.self]
//        let mockUrlSession = URLSession(configuration: config)
        let jsonString = "{\"code\":1}" //寫好預期應該收到的資料
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //Arrange
//        let sut = SignupWebService(urlString:login_url, urlSession: mockUrlSession)
//        let signModel = SignupModel(unid: "mars999", pwd: "a123456", role: "pacient")
        let expectation = self.expectation(description: "Signup web servcie response expectation")
        //act
        sut.signup(signupModel: signModel){ (loginResult, error) in
            //assert
            XCTAssertEqual(loginResult?.code, 1)
            expectation.fulfill()//expectation在時間內要完成 否則失敗
        }
        self.wait(for: [expectation],timeout: 30)
    }
    
    //測試登入json出錯時
    func testSignupWebservice_whenJsonWrong_errorTookPlace(){
        //模擬的網路請求 結果
//        let config = URLSessionConfiguration.ephemeral
//        config.protocolClasses = [MockURLProtocol.self]
//        let mockUrlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":1}" //寫好預期應該收到的資料 預期剖析會出錯
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //Arrange
//        let sut = SignupWebService(urlString:login_url, urlSession: mockUrlSession)
//        let signModel = SignupModel(unid: "mars999", pwd: "a123456", role: "pacient")
        let expectation = self.expectation(description: "Signup web servcie response expectation")
        //act
        sut.signup(signupModel: signModel){ (loginResult, error) in
            //assert
            
            XCTAssertNil(loginResult, "loginResult 應該是nil")
            XCTAssertEqual(error, LoginError.ParseJsonError,"json格式有錯")//error應該是特定的錯誤
            expectation.fulfill()//expectation在時間內要完成 否則失敗
        }
        self.wait(for: [expectation],timeout: 30)
    }
    
    
    func testSignupService_whenEmptyUrlStringProvided_ReturnError(){
        let expectation = self.expectation(description: "提供空url字串")
        //arrange
        let sut = SignupWebService(urlString: "")
        //action
        sut.signup(signupModel: signModel) { (loginResult,error) in
            //assert
            XCTAssertEqual(error, LoginError.invalidURL, "url無效")
            XCTAssertNil(loginResult, "loginResult 應該是nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation],timeout: 20)
        
    }
    ///url 請求失敗
    func testSignupService_whenURLRequestFails_ReturnsErrorMessageDescription(){
        
        let expectation = self.expectation(description: "url請求失敗")
        let errormessage = "The operation couldn’t be completed. (LearnTest.LoginError error 0.)"
        MockURLProtocol.error = LoginError.failedRequest(description:errormessage)
        sut.signup(signupModel: signModel) { signupResponseModel, error in
           
            XCTAssertEqual(error, LoginError.failedRequest(description:errormessage))
            expectation.fulfill()
        }
        
        self.wait(for: [expectation],timeout: 15)
    }


}
