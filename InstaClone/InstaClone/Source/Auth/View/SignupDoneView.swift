//
//  SignupDoneView.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/14.
//

import UIKit

import SnapKit

class SignupDoneView: UIView {
    
    private var guideStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private var welcomeGuideLabel: UILabel = {
        
        var label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "ㅇㅇㅇ님, Instagram에 오신 것을 환영합니다"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    private var welcomeSubGuideLabel: UILabel = {
        
        var label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "언제든지 연락처 정보와 사용자 이름을 변경할 수 있습니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    var doneButton = BasicButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        doneButton.setTitle("완료하기", for: .normal)
        
        [guideStackView, doneButton].forEach { self.addSubview($0) }
        [welcomeGuideLabel, welcomeSubGuideLabel].forEach { guideStackView.addArrangedSubview($0) }
    }
    
    func constraints() {
        
        guideStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(guideStackView.snp.bottom).offset(24)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
