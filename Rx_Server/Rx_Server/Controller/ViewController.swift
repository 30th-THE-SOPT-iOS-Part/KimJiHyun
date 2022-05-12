//
//  ViewController.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/11.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    func binding() {
        
        loginButton.rx.tap
            .subscribe { [unowned self] _ in
                
                APIService.shared.login(email: emailTextField.text!, password: passwordTextField.text!) { response in

                    switch response {
                    case .success(let data):
                        print(data)
                        
                    case .requestErr(let statusCode):
                        print(statusCode)
                    case .pathErr:
                        print("pathErr")
                    case .serverErr:
                        print("serverErr")
                    case .networkFail:
                        print("networkFail")
                    }
                }
            }
            .disposed(by: disposeBag)
    }
}

