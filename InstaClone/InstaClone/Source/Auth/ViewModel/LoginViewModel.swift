//
//  LoginViewModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/15.
//

import Foundation

import RxSwift
import RxCocoa

class LoginViewModel {
    
    struct Input {
        let signupTap: ControlEvent<Void>
    }

    struct Output {
        let signupButtonTapped: ControlEvent<Void>
    }

    var disposeBag = DisposeBag()

    func transform(input: Input) -> Output {
        
        return Output(signupButtonTapped: input.signupTap)
    }
}
