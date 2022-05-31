//
//  LoginViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

import UIKit

class LoginViewController: BaseViewController {
    
    let mainView = LoginView()
    let viewModel = LoginViewModel()
    let httpViewModel = LoginHttpViewModel()
    
    override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func binding() {
    
        
        let input = LoginViewModel.Input(
            userIdText: mainView.userIdTextField.rx.text.orEmpty,
            userPwdText: mainView.userPwdTextField.rx.text.orEmpty,
            eyeTap: mainView.eyeButton.rx.tap,
            signupTap: mainView.signupButton.rx.tap,
            loginTap: mainView.loginButton.rx.tap)
        
        let output = viewModel.transform(input: input)
        
        output.nextButtonValid
            .bind(to: mainView.loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        output.tapEyeButton
            .subscribe { _ in
                
                self.mainView.eyeButton.isSelected ?
                (self.mainView.userPwdTextField.isSecureTextEntry = true) : (self.mainView.userPwdTextField.isSecureTextEntry = false)
                
                self.mainView.eyeButton.isSelected = !self.mainView.eyeButton.isSelected
            }
            .disposed(by: disposeBag)

        output.tapSignupButton
            .subscribe { [weak self] _ in
                let vc = SignupIdViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        output.tapLoginButton
            .subscribe { [weak self] _ in
                
                self?.alert(title: "로그인 성공", okTitle: "확인", okHandler: { action in
                    self?.login()
                })
            }
            .disposed(by: disposeBag)

    }
}

extension LoginViewController {
    
    func login() {
        self.httpViewModel.login(email: (self.mainView.userIdTextField.text)!,
                                  password: (self.mainView.userPwdTextField.text)!) { response in
            
            if let response = response as? LoginData {
                let tabBarController = TabBarController()
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else {return}
                
                window.rootViewController = tabBarController
                
                UIView.transition(with: window, duration: 2, options: .transitionCrossDissolve, animations: {}, completion: nil)
                windowScene.windows.first?.makeKeyAndVisible()
                
                print(response)
            }
            
            if let message = response as? String {
                print(message)
            }
        }
    }
}
