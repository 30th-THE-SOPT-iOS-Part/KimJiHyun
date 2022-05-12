//
//  NSMutableAttributedString+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/05.
//

import UIKit

extension NSMutableAttributedString {
    
    func changeWeight(to weight: UIFont.Weight, content: String, targetString: String, size: CGFloat = 12) -> NSMutableAttributedString {
        
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        self.append(
            NSAttributedString(string: content,attributes: [.font: UIFont.systemFont(ofSize: size, weight: .regular)])
          )
        
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.setAttributes(attributes, range: (string as NSString).range(of: targetString))
        
        return self
    }
}
