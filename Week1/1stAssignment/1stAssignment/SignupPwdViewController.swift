//
//  SignupPwdViewController.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/05.
//

import UIKit

class SignupPwdViewController: UIViewController {
    
    @IBOutlet weak var userPwdTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        guard let doneVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupDoneViewController") as? SignupDoneViewController else { return }
        
        self.navigationController?.pushViewController(doneVC, animated: true)
    }
    
    
    func setup() {
        
    }
    
}
