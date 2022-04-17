//
//  LoginView.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/12.
//

import UIKit

import Then
import SnapKit

class LoginView: UIView {
    
    private var instaLogoImageView = UIImageView().then {
        $0.image = UIImage(named: "instagramLogo")
    }
    
    var userIdTextField = BasicTextField().then {
        $0.placeholder = "전화번호, 사용자 이름 또는 이메일"
    }
    var userPwdTextField = BasicTextField().then {
        $0.placeholder = "비밀번호"
    }
    private var tfRightView = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 43, height: 43)
    }
    var eyeButton = UIButton().then {
        $0.setImage(UIImage(named: "shownEye"), for: .normal)
        $0.setImage(UIImage(named: "hiddenEye"), for: .selected)
    }
    
    var findPwdButton = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 11)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    var loginButton = BasicButton().then {
        $0.setTitle("로그인", for: .normal)
    }
    
    private var signupGuideStackView = UIStackView().then {
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.axis = .horizontal
        $0.spacing = 6
    }
    
    private var signupGuideLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12)
    }
    
    var signupButton = UIButton().then {
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.setTitle("가입하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12)
    }
    
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
        
        userIdTextField.clearButtonMode = .whileEditing
        userPwdTextField.isSecureTextEntry = true
        
        userPwdTextField.rightViewMode = .always
        
        loginButton.isEnabled = false
    }
    
    func configureUI() {
        
        self.backgroundColor = .white
  
        userPwdTextField.rightView = tfRightView
    
        [instaLogoImageView, userIdTextField, userPwdTextField, findPwdButton, loginButton, signupGuideStackView].forEach { self.addSubview($0) }
        
        [signupGuideLabel, signupButton].forEach { signupGuideStackView.addArrangedSubview($0) }
        
        tfRightView.addSubview(eyeButton)
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
        
        eyeButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(20)
            make.trailing.equalToSuperview().inset(16)
            // trailing 안써주면 rightView가 tf에 꽉차는 Issue
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
