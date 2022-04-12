//
//  LoginViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

import UIKit

class LoginViewController: UIViewController {
    
    let mainView = LoginView()
    // let viewModel =
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    func binding() {
        
    }
}
