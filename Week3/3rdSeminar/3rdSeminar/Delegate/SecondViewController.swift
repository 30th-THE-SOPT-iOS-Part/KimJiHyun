//
//  SecondViewController.swift
//  3rdSeminar
//
//  Created by 김지현 on 2022/04/23.
//

import UIKit

protocol SecondViewControllerDelegate {
    func sendData(data: String)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    var delegate: SecondViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sendDataButtonDidTap(_ sender: UIButton) {
        
        if let text = dataTextField.text {
            delegate?.sendData(data: text)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
