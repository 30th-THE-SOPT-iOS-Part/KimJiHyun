//
//  APIService.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/13.
//

import UIKit

import Moya

import RxSwift

struct APIService {
    
    //typealias Response<T: Codable> = NetworkResult<CommonResponse<T>>

    static let shared = APIService()
    let provider = MoyaProvider<APITarget>()
    let disposeBag = DisposeBag()

    func signup(email: String, name: String, password: String, completion: @escaping (NetworkResult<SignupData>) -> Void) {
        
        let target: APITarget = .signup(email: email, name: name, password: password)
        requestResultData(target, completion: completion)
    }
    
    func login(email: String, password: String, completion: @escaping (NetworkResult<LoginData>) -> Void) {

        let target: APITarget = .login(email: email, password: password)
        requestResultData(target, completion: completion)
    }
    
    func getRandomImage(completion: @escaping (NetworkResult<PhotoData>) -> Void) {
        
        // 코드 통일 soon...
        let target: APITarget = .getRandomImage
        provider.request(target) { result in
            
            switch result {
            case .success(let response):
                switch response.statusCode {
                case HTTPStatusCode.SERVER_ERROR.rawValue:
                    completion(.serverErr)
                default:
                    guard let decodedData = try? JSONDecoder().decode(PhotoData.self, from: response.data) else {
                        return completion(.pathErr)
                    }
                    completion(.success(decodedData))
                }
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
}

extension APIService {
    
    func requestResultData<T: Codable>(_ target: APITarget, completion: @escaping (NetworkResult<T>) -> Void) {
        
        provider.request(target) { result in
            
            switch result {
            case .success(let response):
                
                switch response.statusCode {
                case HTTPStatusCode.SERVER_ERROR.rawValue:
                    completion(.serverErr)
                default:
                    guard let decodedData = try? JSONDecoder().decode(CommonResponse<T>.self, from: response.data) else {
                        return completion(.pathErr)
                    }
                    
                    guard let data = decodedData.data else {
                        return completion(.requestErr(decodedData.message))
                    }
                    
                    completion(.success(data))
                }

            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
}
