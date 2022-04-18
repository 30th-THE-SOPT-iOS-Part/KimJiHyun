//
//  UITextField+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

import UIKit

extension UITextField {
    
    func leftPadding(width: Double) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
