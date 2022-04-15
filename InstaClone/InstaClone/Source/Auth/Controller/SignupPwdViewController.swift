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
        binding()
    }
    
    func binding() {
        
        mainView.nextButton.rx.tap
            .subscribe { [weak self] _ in
                let vc = SignupDoneViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
}
