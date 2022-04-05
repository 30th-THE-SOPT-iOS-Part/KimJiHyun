//
//  SignupDoneViewController.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/05.
//

import UIKit

class SignupDoneViewController: UIViewController {
    
    var userName: String?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @IBAction func doneButtonClicked(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }

    func setup() {
        
    }
}
