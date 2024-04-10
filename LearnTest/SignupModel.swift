//
//  SignupModel.swift
//  LearnTest
//
//  Created by 張宮豪 on 2024/3/28.
//

import Foundation


struct SignupModel:Codable {
    let unid,pwd,role:String
//    let unid:String
//    let pwd:String
//    let role:String
    
}

struct LoginResult:Codable {
    let code: Int
//    let rutk, utk01, rurl, jwt: String
//    let uname, umtoken: String
//    let uris: [String]
//    let loc: LOC
//    let roles: [Role]
//    let seid: String
}

struct LOC:Codable {
    let zrtk, zbtk, loctk, zgtk: String
    let ztk: String
}

struct Role:Codable {
    let name, rotk, role: String
}

enum LoginError:LocalizedError, Equatable {
    case ParseJsonError,invalidURL,failedRequest(description:String)
    
    var errorDescription:String? {
        switch self {
        case .ParseJsonError:
            return ""
        case .invalidURL:
            return ""
        case .failedRequest(let description):
            return description
        }
    }
}

//dic["unid"] = account
//dic["pwd"] = password
//dic["role"] = "pacient"

let login_url:String = "https://capi11.shouiot.com:450/user/login"
