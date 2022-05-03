//
//  StoryCollectionViewCell.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/29.
//

import UIKit

import RxSwift

import SnapKit
import Then

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    var disposeBag = DisposeBag()
    
    let profileImageView = UIImageView().then {
        $0.setBorderColorAndRadius(cornerRadius: $0.frame.width/2)
    }
    
    let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "name"
        $0.textAlignment = .center
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        contentView.addSubviews([profileImageView, nameLabel])
    }
    
    func constraints() {
        
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(4)
            make.size.equalTo(48)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(4)
        }

    }
    
}
