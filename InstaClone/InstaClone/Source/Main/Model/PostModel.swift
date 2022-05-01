//
//  PostModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/01.
//

import Foundation

struct PostModel {
    
    let profileImageName: String
    let name: String
    let likeNum: Int
    let content: String
    let commentNum: Int
    
}

extension PostModel {
    
    static let sampleData: [PostModel] = [
        
        PostModel(profileImageName: "", name: "avatar1", likeNum: 1, content: "", commentNum: 1),
        PostModel(profileImageName: "", name: "avatar2", likeNum: 1, content: "", commentNum: 1),
        PostModel(profileImageName: "", name: "avatar3", likeNum: 1, content: "", commentNum: 1),
        PostModel(profileImageName: "", name: "avatar4", likeNum: 1, content: "", commentNum: 1),
        PostModel(profileImageName: "", name: "avatar5", likeNum: 1, content: "", commentNum: 1),
        PostModel(profileImageName: "", name: "avatar6", likeNum: 1, content: "", commentNum: 1),
        
    ]
}
