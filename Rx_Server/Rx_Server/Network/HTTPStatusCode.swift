//
//  HTTPStatusCode.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/11.
//

enum HTTPStatusCode: Int {
    case OK = 200
    case WRONG_VALUE = 400
    case UNSUBSCRIBED_USER = 404
    case SERVER_ERROR = 500
}
