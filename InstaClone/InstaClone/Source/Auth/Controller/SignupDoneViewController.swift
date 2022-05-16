//
//  SignupDoneViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/14.
//

import UIKit

class SignupDoneViewController: BaseViewController {
    
    let mainView = SignupDoneView()
    
    var userId: String = "" {
        didSet {
            mainView.welcomeGuideLabel.text = "\(userId)님, Instagram에 오신 것을 환영합니다"
        }
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func binding() {
        
        mainView.doneButton.rx.tap
            .subscribe { _ in
                self.alert(title: "회원가입 성공", okTitle: "확인", okHandler:  { action in
                    
                    guard let vc = self.presentingViewController as? UINavigationController else { return }
                    self.dismiss(animated: true, completion: {
                        vc.popToRootViewController(animated: true)
                    })
                })
            }
            .disposed(by: disposeBag)
    }
}

