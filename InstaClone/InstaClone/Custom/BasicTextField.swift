//
//  BasicTextField.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/12.
//

import UIKit

final class BasicTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.setBorderColorAndRadius(borderColor: .systemGray5, borderWidth: 1, cornerRadius: 4)
        self.backgroundColor = .systemGray6
        self.font = .systemFont(ofSize: 14)
        self.leftPadding(width: 8)
    }
}
