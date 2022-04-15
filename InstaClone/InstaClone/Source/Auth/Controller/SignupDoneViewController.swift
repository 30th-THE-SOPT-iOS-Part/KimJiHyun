//
//  SignupDoneViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/14.
//

import UIKit

import RxSwift
import RxCocoa

class SignupDoneViewController: UIViewController {
    
    let mainView = SignupDoneView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    func binding() {
        
        mainView.doneButton.rx.tap
            .subscribe { [weak self] _ in
                guard let vc = self?.presentingViewController as? UINavigationController else { return }
                self?.dismiss(animated: true, completion: {
                    vc.popToRootViewController(animated: true)
                })
            }
            .disposed(by: disposeBag)
    }
}

