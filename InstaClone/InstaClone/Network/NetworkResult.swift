//
//  NetworkResult.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/13.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(String)
    case serverErr
    case pathErr
    case networkFail
}
