//
//  SignupPwdViewController.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/05.
//

import UIKit

class SignupPwdViewController: UIViewController {
    
    var userName: String?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var userPwdTextField: UITextField!
    @IBOutlet weak var nextButton: BaseButton!
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userPwdTextField.delegate = self
        nextButton.setTitle("다음", for: .normal)
        nextButton.isEnabled = false
    }
    
    // MARK: - IBAction
    
    @IBAction func nextButtonClicked(_ sender: BaseButton) {
        
        guard let doneVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupDoneViewController") as? SignupDoneViewController else { return }
        
        doneVC.userName = self.userName
        
        doneVC.modalPresentationStyle = .fullScreen
        self.present(doneVC, animated: true, completion: nil)
    }
}

// MARK: - UITextFieldDelegate

extension SignupPwdViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.location == 0 && range.length != 0 {
                self.nextButton.isEnabled = false
            } else {
                self.nextButton.isEnabled = true
            }
            return true
    }
}
