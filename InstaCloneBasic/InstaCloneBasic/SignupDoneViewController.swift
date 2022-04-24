//
//  SignupDoneViewController.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/05.
//

import UIKit

class SignupDoneViewController: UIViewController {
    
    var userName: String?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var doneButton: BaseButton!
    
    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let userName = userName {
            welcomeLabel.text = "\(userName)님 Instagram에 오신 것을 환영합니다"
        }
        
        doneButton.setTitle("완료하기", for: .normal)
    }
    
    // MARK: - IBAction
    
    @IBAction func doneButtonClicked(_ sender: BaseButton) {
        
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        
        self.dismiss(animated: true) {
            presentingVC.popToRootViewController(animated: true)
        }
    }
}
