//
//  SignupIdView.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

import UIKit

final class SignupIdView: BaseView {
    
    private var guideStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private var idGuideLabel: UILabel = {
        
        var label = UILabel()
        label.textAlignment = .center
        label.text = "사용자 이름 만들기"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    private var idSubGuideLabel: UILabel = {
        
        var label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "새 계정에 사용할 사용자 이름을 선택하세요. 나중에 언제든지 변경할 수 있습니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    var userIdTextField = BasicTextField()
    
    var nextButton = BasicButton()
    
    override func setUp() {
        nextButton.isEnabled = false
    }
    
    override func configureUI() {
        
        self.backgroundColor = .white
        
        userIdTextField.placeholder = "사용자 이름"
        nextButton.setTitle("다음", for: .normal)
        
        [guideStackView, userIdTextField, nextButton].forEach { self.addSubview($0) }
        [idGuideLabel, idSubGuideLabel].forEach { guideStackView.addArrangedSubview($0) }
    }
    
    override func constraints() {
        
        guideStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        userIdTextField.snp.makeConstraints { make in
            make.top.equalTo(guideStackView.snp.bottom).offset(30)
            make.height.equalTo(43)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(userIdTextField.snp.bottom).offset(24)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
