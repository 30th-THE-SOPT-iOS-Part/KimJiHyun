//
//  CommonResponse.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/13.
//

import Foundation

struct CommonResponse<T: Codable>: Codable {
    
    let status: Int
    let success: Bool
    let message: String
    let data: T?
}
