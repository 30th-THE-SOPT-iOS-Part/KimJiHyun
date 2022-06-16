//
//  TextFieldViewController.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/18.
//

import UIKit
import RxSwift
import RxCocoa

class TextFieldViewController: UIViewController {
    
    var mainView = TextFieldView()
    var viewModel = TextFieldViewModel()
    
    var disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.textField.delegate = self
    }
    
    
}

// RX + tf delegate 함께 쓰는 이유
// 원하는 경우 UITextField 대리인 https://developer.apple.com/documentation/uikit/uitextfielddelegate/1619599-textfield?language=objc 을 구현해야 합니다. 이것이 더 올바른 옵션입니다. 물론 VM 내부의 텍스트를 포맷하여 textField에 제공할 수 있지만 중간에 있는 값을 편집하려면 커서에 문제가 있습니다.
extension TextFieldViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        textField.formatPhoneNumber(range: range, string: string)
        
        let input = TextFieldViewModel.Input(phoneNum: mainView.textField.rx.text)
        let output = viewModel.transform(input: input)
        
        output.numValidStatus
            .subscribe { status in
            
                if let valid = status.element, valid {
                    print("유효")
                }  else {
                    print("유효X")
                }
            }
            .disposed(by: disposeBag)
        
        // 와 이거 때문에 진짜 몇시간 버림 false 되면 Rx가 작동을 안함
        return false
    }
    
    // 그래서 Rx + tx delegate 함께 쓸 시 이 함수 꼭필요
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
