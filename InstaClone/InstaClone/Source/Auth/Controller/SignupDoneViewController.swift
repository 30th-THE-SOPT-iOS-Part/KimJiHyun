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
                let tabBarController = TabBarController()
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else {return}
                
                window.rootViewController = tabBarController
                
                UIView.transition(with: window, duration: 2, options: .transitionCrossDissolve, animations: {}, completion: nil)
                windowScene.windows.first?.makeKeyAndVisible()
            }
            .disposed(by: disposeBag)
        
        mainView.loginOtherAccountButton.rx.tap
            .subscribe { [weak self] _ in
                guard let vc = self?.presentingViewController as? UINavigationController else { return }
                self?.dismiss(animated: true, completion: {
                    vc.popToRootViewController(animated: true)
                })
            }
            .disposed(by: disposeBag)

    }
}

