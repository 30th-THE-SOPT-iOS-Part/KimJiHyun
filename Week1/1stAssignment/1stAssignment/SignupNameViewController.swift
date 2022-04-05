//
//  SignupNameViewController.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/05.
//

import UIKit

class SignupNameViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        guard let pwdVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupPwdViewController") as? SignupPwdViewController else { return }
        
        self.navigationController?.pushViewController(pwdVC, animated: true)
    }
    
    
    func setup() {
        
    }
}
