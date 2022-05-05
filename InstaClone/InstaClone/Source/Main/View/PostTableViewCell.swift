//
//  PostTableViewCell.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/02.
//

import UIKit

import RxSwift

import SnapKit
import Then

class PostTableViewCell: UITableViewCell {

    static let identifier = "PostTableViewCell"
    private var disposeBag = DisposeBag()
    
    let topView = UIView()
    let buttonView = UIView()
    let bottomView = UIView()
    
    let profileImageView = UIImageView().then {
        $0.setBorderColorAndRadius(cornerRadius: $0.frame.width/2)
    }
    
    let nameButton = UIButton().then {
        $0.setTitle("name", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    let threeDotButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_more"), for: .normal)
    }
    
    let postIamgeView = UIImageView()
    
    let likeButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_unlike"), for: .normal)
    }
    let commentButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_comment"), for: .normal)
    }
    let shareButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_share"), for: .normal)
    }
    let bookmarkButton = UIButton().then {
        $0.setImage(UIImage(named: "icn_bookmark"), for: .normal)
    }
    
    let likeNumLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.text = "좋아요 30개"
        $0.textAlignment = .left
    }
    
    let contentLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "content"
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    let commentNumButton = UIButton().then {
        $0.titleLabel?.textColor = .systemGray3
        $0.titleLabel?.font = .systemFont(ofSize: 11, weight: .regular)
        $0.titleLabel?.textAlignment = .left
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        topView.addSubviews([profileImageView, nameButton, threeDotButton])
        buttonView.addSubviews([likeButton, commentButton, shareButton, bookmarkButton])
        bottomView.addSubviews([likeNumLabel, contentLabel, commentNumButton])
        
        contentView.addSubviews([topView, postIamgeView, buttonView, bottomView])
    }
    
    func constraints() {
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(6)
            make.size.equalTo(24)
        }
        
        nameButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.leading.equalTo(profileImageView.snp.trailing).offset(4)
        }
        
        threeDotButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.right.equalToSuperview().inset(10)
            make.size.equalTo(24)
        }
        
        postIamgeView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(postIamgeView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        likeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(24)
        }
        
        commentButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(likeButton.snp.trailing).offset(10)
            make.size.equalTo(24)
        }
        
        shareButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(commentButton.snp.trailing).offset(10)
            make.size.equalTo(24)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.size.equalTo(24)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        likeNumLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(8)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(likeNumLabel.snp.bottom).offset(10)
            make.leading.equalTo(likeNumLabel.snp.leading)
            make.trailing.equalToSuperview().inset(10)
        }
        
        commentNumButton.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }

}
