//
//  BaseButton.swift
//  1stAssignment
//
//  Created by 김지현 on 2022/04/06.
//

import UIKit

final class BaseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    func setup() {
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 100/255, blue: 220/255, alpha: 1))
        self.setBorderColorAndRadius(cornerRadius: 4)
    }

}
