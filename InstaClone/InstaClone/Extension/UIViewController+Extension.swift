//
//  UIViewController+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/16.
//

import UIKit

extension UIViewController {
    
    typealias AlertActionHandler = ((UIAlertAction) -> Void)
    
    func alert(title: String,
               message: String? = nil,
               okTitle: String = "확인",
               cancelTitle: String? = "취소",
               okHandler: AlertActionHandler? = nil,
               cancelHandler: AlertActionHandler? = nil,
               completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let okClosure = okHandler, let cancelClosure = cancelHandler { // 확인 핸들러 존재할 때
            let okAction: UIAlertAction = UIAlertAction(title: okTitle, style: .destructive, handler: okClosure)
            alert.addAction(okAction)
            let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelClosure)
            alert.addAction(cancelAction)
        } else {
            if let okClosure = okHandler {
                let okAction: UIAlertAction = UIAlertAction(title: okTitle, style: .default, handler: okClosure)
                alert.addAction(okAction)
            } else if let cancelClosure = cancelHandler {
                let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelClosure)
                  alert.addAction(cancelAction)
            }
        }
        self.present(alert, animated: true, completion: completion)
    }
}
