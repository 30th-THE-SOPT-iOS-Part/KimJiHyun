//
//  ViewController.swift
//  1stSeminar
//
//  Created by 김지현 on 2022/04/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonDidTap(_ sender: Any) {
        messageLabel.text = "새로운 메세지가 도착했어요!"
        messageLabel.textColor = .green
        messageLabel.sizeToFit()
        AudioServicesPlayAlertSound(SystemSoundID(1307))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "도착한 메세지가 없어요!"
    }
}

