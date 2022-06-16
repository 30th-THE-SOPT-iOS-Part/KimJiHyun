//
//  TextFieldView.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/18.
//

import UIKit
import SnapKit

class TextFieldView: UIView {
    
    var textField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        self.backgroundColor = .yellow
        textField.backgroundColor = .white
        textField.placeholder = "전화번호 입력"
        self.addSubview(textField)
    }
    
    func constraints() {
        
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
