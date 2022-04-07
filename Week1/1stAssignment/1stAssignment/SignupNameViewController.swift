//
//  SignupNameViewController.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/05.
//

import UIKit

class SignupNameViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var nextButton: BaseButton!
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        nextButton.setTitle("다음", for: .normal)
        nextButton.isEnabled = false
        
        navigationItem.backButtonTitle = ""
    }
    
    // MARK: - IBAction
    
    @IBAction func nextButtonClicked(_ sender: BaseButton) {
        
        guard let pwdVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupPwdViewController") as? SignupPwdViewController else { return }
        
        pwdVC.userName = userNameTextField.text
        
        self.navigationController?.pushViewController(pwdVC, animated: true)
    }
}

// MARK: - UITextFieldDelegate

// 방법2. UITextFieldDelegate
extension SignupNameViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.location == 0 && range.length != 0 {
            self.nextButton.isEnabled = false
        } else {
            self.nextButton.isEnabled = true
        }
        return true
    }
}
