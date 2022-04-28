//
//  LoginViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

import UIKit

import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    let mainView = LoginView()
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    func binding() {
        
        mainView.userIdTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe { text in
                print(text)
            }
            .disposed(by: disposeBag)
        
        let input = LoginViewModel.Input(
            userIdText: mainView.userIdTextField.rx.text.orEmpty,
            userPwdText: mainView.userPwdTextField.rx.text.orEmpty,
            eyeTap: mainView.eyeButton.rx.tap,
            signupTap: mainView.signupButton.rx.tap)
        
        let output = viewModel.transform(input: input)
        
        output.nextButtonValid
            .bind(to: mainView.loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        output.tapEyeButton
            .subscribe { _ in
                
                self.mainView.eyeButton.isSelected ? (self.mainView.userPwdTextField.isSecureTextEntry = true) : (self.mainView.userPwdTextField.isSecureTextEntry = false)
                
                self.mainView.eyeButton.isSelected = !self.mainView.eyeButton.isSelected
            }
            .disposed(by: disposeBag)

        output.tapSignupButton
            .subscribe { [weak self] _ in
                let vc = SignupIdViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
