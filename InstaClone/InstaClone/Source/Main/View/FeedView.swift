//
//  FeedView.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/29.
//

import UIKit

class FeedView: BaseView {
    
    var feedTableView = UITableView().then {
        
        $0.backgroundColor = .systemGray3
        $0.separatorColor = .clear
        $0.rowHeight = 100
        $0.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
    }
    
    var storyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        $0.collectionViewLayout = layout
        $0.backgroundColor = .systemGray6
        $0.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
    }
    
    override func setUp() {
        
    }
    
    override func configureUI() {
        
        self.addSubview(storyCollectionView)
        self.addSubview(feedTableView)
        
    }
    
    override func constraints() {
        
        storyCollectionView.snp.makeConstraints { make in
            
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        feedTableView.snp.makeConstraints { make in
            make.top.equalTo(storyCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
}
