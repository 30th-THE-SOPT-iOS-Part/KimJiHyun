//
//  SignupPwdView.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/13.
//

import UIKit

import SnapKit

class SignupPwdView: UIView {
    
    private var guideStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private var pwdGuideLabel: UILabel = {
        
        var label = UILabel()
        label.textAlignment = .center
        label.text = "비밀번호 만들기"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    private var pwdSubGuideLabel: UILabel = {
        
        var label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인 정보를 입력하지 않아도 됩니다."
        label.textColor = .black
        label.font = .systemFont(ofSize: 11, weight: .regular)
        return label
    }()
    
    var userPwdTextField = BasicTextField()
    
    var nextButton = BasicButton()
    
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
        
        userPwdTextField.placeholder = "비밀번호"
        nextButton.setTitle("다음", for: .normal)
        
        [guideStackView, userPwdTextField, nextButton].forEach { self.addSubview($0) }
        [pwdGuideLabel, pwdSubGuideLabel].forEach { guideStackView.addArrangedSubview($0) }
    }
    
    func constraints() {
        
        guideStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        userPwdTextField.snp.makeConstraints { make in
            make.top.equalTo(guideStackView.snp.bottom).offset(30)
            make.height.equalTo(43)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(userPwdTextField.snp.bottom).offset(24)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
