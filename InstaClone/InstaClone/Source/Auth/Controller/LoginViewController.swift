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
        
        let input = LoginViewModel.Input(signupTap: mainView.signupButton.rx.tap)
        let output = viewModel.transform(input: input)
        
        output.signupButtonTapped
            .subscribe { [weak self] _ in
                let vc = SignupNameViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
