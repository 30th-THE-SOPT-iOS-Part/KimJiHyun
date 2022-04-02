//
//  FirstViewController.swift
//  1stSeminar
//
//  Created by 김지현 on 2022/04/02.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToSecondViewController(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        nextVC.message = dataTextField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
