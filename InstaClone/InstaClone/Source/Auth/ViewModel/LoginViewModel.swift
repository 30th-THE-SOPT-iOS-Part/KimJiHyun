//
//  LoginViewModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/15.
//

import Foundation

import RxSwift
import RxCocoa

final class LoginViewModel: CommonViewModel {
    
    struct Input {
        let userIdText: ControlProperty<String>
        let userPwdText: ControlProperty<String>
        let eyeTap: ControlEvent<Void>
        let signupTap: ControlEvent<Void>
        let loginTap: ControlEvent<Void>
    }

    struct Output {
        let nextButtonValid: Observable<Bool>
        let tapEyeButton: ControlEvent<Void>
        let tapSignupButton: ControlEvent<Void>
        let tapLoginButton: ControlEvent<Void>
    }

    var disposeBag = DisposeBag()

    func transform(input: Input) -> Output {
        
        let valid = Observable.combineLatest(
            input.userIdText.distinctUntilChanged(),
            input.userPwdText.distinctUntilChanged())
            .map { (id, pwd) -> Bool in
                return id.count >= 2 && pwd.count >= 2
            }
        
        return Output(nextButtonValid: valid, tapEyeButton: input.eyeTap, tapSignupButton: input.signupTap, tapLoginButton: input.loginTap)
    }
}
