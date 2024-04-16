//
//  SignupWebService.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/3/28.
//

import Foundation


class SignupWebService:SignupWebServiceProtocol {

    
    private var urlString:String
    private var urlSession:URLSession
    init(urlString:String,urlSession:URLSession = .shared){
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(signupModel:SignupForModel,completionhandler:@escaping (LoginResult?,LoginError?) -> Void){
        guard let url = URL(string: urlString) else {
            completionhandler(nil,LoginError.invalidURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(signupModel)
        
        
        urlSession.dataTask(with: request) { data, response, error in
            if let requestError = error  {
                completionhandler(nil, LoginError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let loginResult = try? JSONDecoder().decode(LoginResult.self, from: data){
                completionhandler(loginResult, nil)
            }else {
                //TODO: create a unit test  if error here
                completionhandler(nil, LoginError.ParseJsonError)
            }
            
        }
        .resume()
        
    }
    
}
