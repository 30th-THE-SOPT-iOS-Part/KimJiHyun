//
//  SignupIdViewModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/17.
//

import Foundation

import RxSwift
import RxCocoa

class SignupIdViewModel {
    
    struct Input {
        let userIdText: ControlProperty<String?>
        let nextTap: ControlEvent<Void>
    }

    struct Output {
        let nextButtonValid: Observable<Bool>
        let tapNextButton: ControlEvent<Void>
    }

    var disposeBag = DisposeBag()

    func transform(input: Input) -> Output {
        
        let valid = input.userIdText
            .orEmpty
            .distinctUntilChanged()
            .map { $0.count >= 2 }

        return Output( nextButtonValid: valid, tapNextButton: input.nextTap)
    }
}
