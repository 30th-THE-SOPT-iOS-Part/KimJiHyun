//
//  FeedView.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/29.
//

import UIKit

class FeedView: BaseView {
    
    var feedTableView = UITableView().then {
        
        $0.backgroundColor = .systemGray5
        $0.separatorColor = .clear
        $0.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
    }
    
    var storyCollectionView = UICollectionView().then {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        $0.collectionViewLayout = layout
        $0.backgroundColor = .systemGray6
        $0.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
    }
    
    override func setUp() {
        
    }
    
    override func configureUI() {
        
        
    }
    
    override func constraints() {
        
    }
}
