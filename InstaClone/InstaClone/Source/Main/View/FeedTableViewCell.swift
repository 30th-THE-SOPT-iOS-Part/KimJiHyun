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
        
    }
    
    func constraints() {
        
    }

}
