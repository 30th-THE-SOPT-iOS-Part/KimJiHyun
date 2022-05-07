//
//  LoginModel.swift
//  4thSeminar
//
//  Created by 김지현 on 2022/05/07.
//

import Foundation

/*
 {
   "status": 200,
   "message": "string",
   "data": {
     "email": "string",
     "name": "string"
   }
 }
 
 {
   "status": 200,
   "success": false,
   "message": {
        "reason": "Invalid",
        "으엥
   }
 }
 */

struct LoginResponse: Codable {
    let status: Int
//    let success: Bool?
    let message: String
    let data: LoginData?
}

struct LoginData: Codable {
    let name: String
    let email: String
}

//struct MessageData: Codable {
//
//}
