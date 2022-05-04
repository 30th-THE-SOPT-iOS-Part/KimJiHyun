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
    let postImageName: String
    let likeNum: Int
    let content: String
    let commentNum: Int
    
}

extension PostModel {
    
    static let sampleData: [PostModel] = [
        
        PostModel(profileImageName: "더미", name: "", postImageName: "", likeNum: 0, content: "", commentNum: 0),
        PostModel(profileImageName: "avatar1", name: "avatar1", postImageName: "postImage1", likeNum: 1, content: "첫번째 게시물", commentNum: 1),
        PostModel(profileImageName: "avatar2", name: "avatar2", postImageName: "postImage2", likeNum: 1, content: "두번째 게시물", commentNum: 1),
        PostModel(profileImageName: "avatar3", name: "avatar3", postImageName: "postImage3", likeNum: 1, content: "세번째 게시물", commentNum: 1),
        PostModel(profileImageName: "avatar4", name: "avatar4", postImageName: "postImage4", likeNum: 1, content: "네번째 게시물", commentNum: 1),
        PostModel(profileImageName: "avatar5", name: "avatar5", postImageName: "postImage1", likeNum: 1, content: "다섯번째 게시물", commentNum: 1),
        PostModel(profileImageName: "avatar6", name: "avatar6", postImageName: "postImage2", likeNum: 1, content: "여섯번째 게시물", commentNum: 1),
        
    ]
}
