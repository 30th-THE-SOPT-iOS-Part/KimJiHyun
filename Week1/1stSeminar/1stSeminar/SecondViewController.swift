//
//  SecondViewController.swift
//  1stSeminar
//
//  Created by 김지현 on 2022/04/02.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    var message: String?
    // IBOutlet 변수는 외부에서 직접 값을 대입할 수 없는 변수
    // 외부에서 직접 참조도 불가
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMessage()
    }
    
    /*
     present - dismiss : modal
     push - pop : navigation
     */
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setMessage() {
        if let message = message {
            messageLabel.text = message
            messageLabel.sizeToFit()
        }
    }
    
}
