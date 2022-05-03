//
//  UIView+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/12.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    func setBorderColorAndRadius(borderColor: UIColor = .clear, borderWidth: CGFloat = 0, cornerRadius: CGFloat) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
