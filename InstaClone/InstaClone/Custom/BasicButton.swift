//
//  BasicButton.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/12.
//

import UIKit

final class BasicButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .systemBlue
        self.setBorderColorAndRadius(cornerRadius: 4)
    }

}
