//
//  LoginView.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/12.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    private var instaLogoImageView = UIImageView()
    
    var userIdTextField = BasicTextField()
    var userPwdTextField = BasicTextField()
    
    var findPwdButton = UIButton()
    
    var loginButton = BasicButton()
    
    private var signupGuideStackView: UIStackView = {
       
        var stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 6
        return stackView
    }()
    
    private var signupGuideLabel = UILabel()
    var signupButton = UIButton()
    
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
        
        // 요게 ... setup에 가야 하나 ???
        instaLogoImageView.image = UIImage(named: "instagramLogo")
        
        userIdTextField.placeholder = "전화번호, 사용자 이름 또는 이메일"
        userPwdTextField.placeholder = "비밀번호"
        
        findPwdButton.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        findPwdButton.titleLabel?.font = .systemFont(ofSize: 11)
        findPwdButton.setTitleColor(.systemBlue, for: .normal)
        
        loginButton.setTitle("로그인", for: .normal)
        
        signupGuideLabel.text = "계정이 없으신가요?"
        signupGuideLabel.textColor = .black
        signupGuideLabel.font = .systemFont(ofSize: 12)
        
        signupButton.setTitleColor(.systemBlue, for: .normal)
        signupButton.setTitle("가입하기", for: .normal)
        signupButton.titleLabel?.font = .systemFont(ofSize: 12)
        
        [instaLogoImageView, userIdTextField, userPwdTextField, findPwdButton, loginButton, signupGuideStackView].forEach { self.addSubview($0) }
        [signupGuideLabel, signupButton].forEach { signupGuideStackView.addArrangedSubview($0) }
    }
    
    func constraints() {
        
        instaLogoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(instaLogoImageView.snp.width).multipliedBy(2.0/7.0)
        }
        
        userIdTextField.snp.makeConstraints { make in
            make.top.equalTo(instaLogoImageView.snp.bottom).offset(40)
            make.height.equalTo(43)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        userPwdTextField.snp.makeConstraints { make in
            make.top.equalTo(userIdTextField.snp.bottom).offset(16)
            make.height.equalTo(43)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        findPwdButton.snp.makeConstraints { make in
            make.top.equalTo(userPwdTextField.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(findPwdButton.snp.bottom).offset(40)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        signupGuideStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(40)
        }
        
        
        
    }
}
