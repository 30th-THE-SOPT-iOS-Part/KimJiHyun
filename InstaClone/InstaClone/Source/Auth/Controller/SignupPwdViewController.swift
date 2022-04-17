//
//  SignupPwdViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

import UIKit

import RxSwift
import RxCocoa

class SignupPwdViewController: UIViewController {
    
    let mainView = SignupPwdView()
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
                let vc = SignupDoneViewController()
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
    }
}
