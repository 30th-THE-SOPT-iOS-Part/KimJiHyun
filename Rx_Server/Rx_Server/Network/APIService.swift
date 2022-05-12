//
//  APIService.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/11.
//

import UIKit

import Moya

import RxSwift
import RxMoya

struct APIService {

    static let shared = APIService()
    let provider = MoyaProvider<APITarget>()
    let disposeBag = DisposeBag()

    func login(email: String, password: String, completion: @escaping (NetworkResult<LoginResponse>) -> Void) {

        let target: APITarget = .login(email: email, password: password)
       requestResultDataRx(target, completion: completion)
    }
    
    func getPost(accessToken: String, postId: Int,completion: @escaping (NetworkResult<PostResponse>) -> Void) {
        
        let target: APITarget = .getPost(accesstoken: accessToken, postId: postId)
        requestResultDataRx(target, completion: completion)
    }
}

extension APIService {
    
    func requestResultData<T: Codable>(_ target: APITarget, completion: @escaping (NetworkResult<T>) -> Void) {
        
        provider.request(target) { result in
            
            switch result {
            case .success(let response):
                
                switch response.statusCode {
                case HTTPStatusCode.OK.rawValue:
                    do {
                        let decoder = JSONDecoder()
                        let body = try decoder.decode(T.self, from: response.data)
                        completion(.success(body))
                    } catch {
                        print("구조 확인")
                    }
                case HTTPStatusCode.WRONG_VALUE.rawValue:
                    completion(.requestErr(response.statusCode))
                case HTTPStatusCode.UNSUBSCRIBED_USER.rawValue:
                    completion(.requestErr(response.statusCode))
                case HTTPStatusCode.SERVER_ERROR.rawValue:
                    completion(.serverErr)
                default:
                    print("default")
                }

            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    func requestResultDataRx<T: Codable>(_ target: APITarget, completion: @escaping (NetworkResult<T>) -> Void) {
        
        provider.rx.request(target)
            .retry(3)
            .subscribe { event in
            
            switch event {
            case .success(let response):
                
                switch response.statusCode {
                case HTTPStatusCode.OK.rawValue:
                    do {
                        let decoder = JSONDecoder()
                        let body = try decoder.decode(T.self, from: response.data)
                        completion(.success(body))
                    } catch {
                        print("구조 확인")
                    }
                case HTTPStatusCode.WRONG_VALUE.rawValue:
                    completion(.requestErr(response.statusCode))
                case HTTPStatusCode.UNSUBSCRIBED_USER.rawValue:
                    completion(.requestErr(response.statusCode))
                case HTTPStatusCode.SERVER_ERROR.rawValue:
                    completion(.serverErr)
                default:
                    print("default")
                }

            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
        .disposed(by: disposeBag)
    }
}
