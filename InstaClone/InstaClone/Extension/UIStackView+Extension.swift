//
//  UIStackView+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/05.
//

import UIKit

extension UIStackView {
    
    var horizontalSpacing: UIStackView {
    
        self.distribution = .equalSpacing
        self.axis = .horizontal
        self.alignment = .center
        self.spacing = 16
        
        return self
    }
}
