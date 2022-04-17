//
//  SignupNameViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

import UIKit

import RxSwift
import RxCocoa

class SignupNameViewController: UIViewController {
    
    let mainView = SignupNameView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        binding()
    }
    
    func configureUI() {
        
        navigationController?.initializeNavigationBarWithBackButton(navigationItem: self.navigationItem)
    }
    
    func binding() {
        
        mainView.nextButton.rx.tap
            .subscribe { [weak self] _ in
                let vc = SignupPwdViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
    }
}
