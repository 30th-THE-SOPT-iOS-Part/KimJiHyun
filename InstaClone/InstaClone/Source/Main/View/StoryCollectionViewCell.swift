//
//  StoryCollectionViewCell.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/29.
//

import UIKit

import SnapKit
import Then

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
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
