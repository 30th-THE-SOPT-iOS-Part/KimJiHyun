//
//  APITarget.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/13.
//

import Foundation
import Moya

enum APITarget {
    case signup(email: String, name: String, password: String)
    case login(email: String, password: String)
}

extension APITarget: TargetType {
    
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signup:
            return APIConstants.signupPath
        case .login:
            return APIConstants.loginPath
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup, .login:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .signup(let email, let name, let password):
            return .requestParameters(parameters: ["email": email, "name": name, "password": password], encoding: JSONEncoding.default)
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signup(_,_,_), .login(_,_):
            return ["Content-Type" : "application/json"]
        }
    }
}
