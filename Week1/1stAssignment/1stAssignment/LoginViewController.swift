//
//  LoginViewController.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/05.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var userPwdTextField: UITextField!
    
    @IBOutlet weak var findPwdButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: BaseButton!
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - func
    
    func setup() {

        userIdTextField.addAction(UIAction(handler: textHandler), for: .editingChanged)
        userPwdTextField.addAction(UIAction(handler: textHandler), for: .editingChanged)
        
        userIdTextField.clearButtonMode = .whileEditing
        
        loginButton.isEnabled = false
        loginButton.setTitle("로그인", for: .normal)
        self.navigationItem.backBarButtonItem?.image = UIImage(named: "backButton")
        
    }
    
    // 방법1. addAction 
    func textHandler(_ a: UIAction) -> Void {
        if userIdTextField.text!.isEmpty || userPwdTextField.text!.isEmpty  {
            self.loginButton.isEnabled = false
        } else {
            self.loginButton.isEnabled = true
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func findPwdButtonClicked(_ sender: UIButton) {
        
        print("비번 찾기 클릭")
    }
    
    @IBAction func loginButtonClicked(_ sender: BaseButton) {
        
        print("로그인 클릭")
        
//        guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
//
//        self.present(mainVC, animated: true, completion: nil)
    }
    
    @IBAction func signupButtonClicked(_ sender: UIButton) {

        guard let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupNameViewController") as? SignupNameViewController else { return }
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
}


