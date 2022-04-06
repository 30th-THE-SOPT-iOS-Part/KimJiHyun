//
//  UIView+Extension.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/06.
//

import UIKit

extension UIView {
    
    func setBorderColorAndRadius(borderColor: UIColor = .clear, borderWidth: CGFloat = 0, cornerRadius: CGFloat) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
