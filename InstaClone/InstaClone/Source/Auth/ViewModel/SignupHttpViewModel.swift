//
//  SignupHttpViewModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/13.
//

import Foundation
import RxSwift
import RxCocoa

class SignupHttpViewModel {
    
    func signup(emailAndName: String, password: String, completion: @escaping (Any) -> Void) {
        
        APIService.shared.signup(email: emailAndName, name: emailAndName, password: password) { result in
            
            switch result {
                
            case .success(let response):
                completion(response)
            case .requestErr(let message):
                completion(message)
            case .networkFail:
                print("네트워크 통신 실패 alert")
            case .serverErr:
                print("서버에러")
            case .pathErr:
                print("에러")
            }
        }
    }
}
