//
//  SignupNameViewModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/15.
//

import Foundation

import RxSwift
import RxCocoa

class SignupNameViewModel {
    
    struct Input {
        let nextTap: ControlEvent<Void>
    }

    struct Output {
        let nextButtonTapped: ControlEvent<Void>
    }

    var disposeBag = DisposeBag()

    func transform(input: Input) -> Output {
        
        return Output(nextButtonTapped: input.nextTap)
    }
}
