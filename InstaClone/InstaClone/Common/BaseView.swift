//
//  BaseView.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/01.
//

import UIKit

import SnapKit
import Then

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        configureUI()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
    }
    
    func configureUI() {
        
        self.backgroundColor = .white
    }
    
    func constraints() {
        
    }
}
