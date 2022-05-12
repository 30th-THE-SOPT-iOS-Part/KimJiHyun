//
//  APITarget.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/11.
//

import Foundation
import Moya

enum APITarget {
    case login(email: String, password: String)
    case getPost(accesstoken: String, postId: Int)
}

extension APITarget: TargetType {
    
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .login:
            return APIConstants.loginPath
        case .getPost:
            return APIConstants.getPostPath
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .getPost:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .getPost:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login(_, _):
            return ["Content-Type" : "application/json"]
        case .getPost(let accesstoken, _):
            return ["Content-Type" : "application/json", "accesstoken" : accesstoken]
        }
    }
}
