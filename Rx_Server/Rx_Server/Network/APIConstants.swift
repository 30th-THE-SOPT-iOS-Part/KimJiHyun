//
//  APIConstants.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/11.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "https://asia-northeast3-vegin-2a51e.cloudfunctions.net/api"

    static let loginPath = "/auth/login"
    static let getPostPath = "/post/:postId"
}
