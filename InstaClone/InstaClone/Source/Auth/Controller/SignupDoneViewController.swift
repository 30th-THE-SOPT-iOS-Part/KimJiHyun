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
        binding()
    }
    
    func binding() {
        
        mainView.doneButton.rx.tap
            .subscribe { _ in
                let tabBarController = TabBarController()
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {return}
                windowScene.windows.first?.rootViewController = tabBarController
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

