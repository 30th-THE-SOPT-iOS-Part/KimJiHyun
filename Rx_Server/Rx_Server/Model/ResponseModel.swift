//
//  ResponseModel.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/11.
//

import Foundation

struct LoginResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginData?
}

struct LoginData: Codable {
    let user: UserData?
    let accesstoken: String
}

struct UserData: Codable {
    let userId: Int
    let email: String
    let character: Int
    let orientation: String
}

struct PostResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: PostData?
}

struct PostData: Codable {
    let postId: Int
    let title: String
    let content: String
    let tag: String
    let imageURL: String
    let createdAt: String
    let writer: WriterData?
    let emojiList: [String]
}

struct WriterData: Codable {
    let userId: Int
    let nickname: String
    let profileImageId: Int
}
