//
//  DelegatePracticeViewController.swift
//  3rdSeminar
//
//  Created by 김지현 on 2022/04/23.
//

import UIKit

class DelegatePracticeViewController: UIViewController, SecondViewControllerDelegate {
    
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

    func sendData(data: String) {
        
        dateLabel.text = data
    }
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        
        print("와이라노")
        
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        secondViewController.delegate = self
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}

extension DelegatePracticeViewController: UITextFieldDelegate {
    
    // 텍스트 필드를 터치하고 편집이 시작될 때 실행
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print("텍스트필드의 편집이 시작되었습니다")
    }

    // 텍스트 필드 편집 중 키보드에서 return 키를 눌렀을 때 실행되는 메서드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 텍스트 필드의 편집을 끝내주는 메서드
        textField.endEditing(true)
        return true
    }

    // 텍스트 필드의 편집을 끝낼 때 실행되는 메서드
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        print("텍스트필드의 편집이 끝났습니다")
    }
}
