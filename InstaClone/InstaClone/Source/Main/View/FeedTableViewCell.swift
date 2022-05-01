//
//  FeedTableViewCell.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/29.
//

import UIKit

import SnapKit
import Then

class FeedTableViewCell: UITableViewCell {

    static let identifier = "FeedTableViewCell"
    
    private let backView = UIView().then {
        $0.backgroundColor = .red
    }
    
    let label = UILabel().then {
        $0.textColor = .white
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .red
        setUp()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        contentView.addSubview(backView)
        contentView.addSubview(label)
    }
    
    func constraints() {
        
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(8)
            make.centerY.equalToSuperview()
        }
    }

}
