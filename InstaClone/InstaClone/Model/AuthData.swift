//
//  AuthData.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/13.
//

import Foundation

struct SignupData: Codable {
    let id: Int
}

struct LoginData: Codable {
    let name: String
    let email: String
}
