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
    case getRandomImage
}

extension APITarget: TargetType {
    
    var baseURL: URL {
        switch self {
        case .signup, .login:
            return URL(string: APIConstants.baseURL)!
        case .getRandomImage:
            return URL(string: APIConstants.picsumURL)!
            
        }
    }
    
    var path: String {
        switch self {
        case .signup:
            return APIConstants.signupPath
        case .login:
            return APIConstants.loginPath
        case .getRandomImage:
            return APIConstants.randomImagePath
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup, .login:
            return .post
        case .getRandomImage:
            return .get
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
        case .getRandomImage:
            return .requestParameters(parameters: ["limit": 7], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signup(_,_,_), .login(_,_), .getRandomImage:
            return ["Content-Type" : "application/json"]
        }
    }
}
