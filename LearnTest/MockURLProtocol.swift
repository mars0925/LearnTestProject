//
//  MockURLProtocol.swift
//  LearnTest
//  提供一種模擬網絡請求和響應的方法
//  Created by 張宮豪 on 2024/4/2.
//

import Foundation

class MockURLProtocol:URLProtocol{
    
    static var stubResponseData:Data? //設定預載資料
    static var error:Error? //設定預載錯誤
    
    //確定子類別是否可以處理請求，返回true表示可以處理所有請求
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    // 重寫此方法來返回規範化的請求
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        // 在這裡，你可以修改請求，比如更改URL或者修改頭部信息
        return request
    }
    ///當協定處理某個請求時，系統會調用此方法，開始加載請求數據，執行請求修改或者從緩存中返回數據的地方。
    ///可以在這裡寫入hardcode 程式來模擬網路請求，用來做unit test
    override func startLoading() {
       
        
        if let signUpError = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: signUpError)//預設error
        }else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())//載入預寫的資料
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
    
}
