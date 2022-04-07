//
//  LoginViewController.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/05.
//

import UIKit

class LoginViewController: UIViewController {
    
    var eyeButton = UIButton()
    
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
        configure()
    }
    
    // MARK: - func
    
    func setup() {
    
        userIdTextField.clearButtonMode = .whileEditing
        userPwdTextField.isSecureTextEntry = true

        userIdTextField.addAction(UIAction(handler: textHandler), for: .editingChanged)
        userPwdTextField.addAction(UIAction(handler: textHandler), for: .editingChanged)
        
        eyeButton.addTarget(self, action: #selector(tapEyeButton), for: .touchUpInside)
        
        
        
        loginButton.isEnabled = false
    }
    
    func configure() {
        
        loginButton.setTitle("로그인", for: .normal)
        
        let tfHeight = userPwdTextField.bounds.height
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: tfHeight, height: tfHeight))
   
        eyeButton.setBackgroundImage(UIImage(named: "shownEye"), for: .normal)
        eyeButton.frame = CGRect(x: rightView.center.x - 12.5  ,y: rightView.center.y - 12.5, width: 25, height: 25)
        
        rightView.addSubview(eyeButton)
        
        userPwdTextField.rightView = rightView
        userPwdTextField.rightViewMode = UITextField.ViewMode.always
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.backButtonTitle = ""
    }
    
    // 방법1. addAction 
    func textHandler(_ a: UIAction) -> Void {
        if userIdTextField.text!.isEmpty || userPwdTextField.text!.isEmpty  {
            self.loginButton.isEnabled = false
        } else {
            self.loginButton.isEnabled = true
        }
    }
    
    @objc func tapEyeButton() {
        
        userPwdTextField.isSecureTextEntry == true ? eyeButton.setBackgroundImage(UIImage(named: "shownEye"), for: .normal) : eyeButton.setBackgroundImage(UIImage(named: "hiddenEye"), for: .normal)
        
        userPwdTextField.isSecureTextEntry = !userPwdTextField.isSecureTextEntry
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


