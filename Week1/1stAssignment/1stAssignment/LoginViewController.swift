//
//  LoginViewController.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/05.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var userPwdTextField: UITextField!
    
    @IBOutlet weak var findPwdButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @IBAction func findPwdButtonClicked(_ sender: UIButton) {
        
        print("비번 찾는 뷰")
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        print("로그인 후 화면")
        
//        guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
//
//        self.present(mainVC, animated: true, completion: nil)
    }
    
    @IBAction func signupButtonClicked(_ sender: UIButton) {
        
        guard let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupNameViewController") as? SignupNameViewController else { return }
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    func setup() {
        
        
        
    }
}
