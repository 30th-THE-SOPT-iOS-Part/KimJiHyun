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
        $0.showsVerticalScrollIndicator = false
        $0.register(StoryCollectionTableViewCell.self, forCellReuseIdentifier: StoryCollectionTableViewCell.identifier)
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
    }
    
    override func setUp() {
        
        feedTableView.bounces = false
    }
    
    override func configureUI() {
        
        self.addSubview(feedTableView)
    }
    
    override func constraints() {
        
        feedTableView.snp.makeConstraints { make in
            
            make.top.bottom.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
