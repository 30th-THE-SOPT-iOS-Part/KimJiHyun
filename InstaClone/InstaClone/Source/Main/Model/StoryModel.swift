//
//  StoryModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/01.
//

import Foundation

struct StoryModel {
    
    let profileImageName: String
    let name: String
    
}

extension StoryModel {
    
    static let sampleData: [StoryModel] = [
        
        StoryModel(profileImageName: "avatar1", name: "avatar1"),
        StoryModel(profileImageName: "avatar2", name: "avatar2"),
        StoryModel(profileImageName: "avatar3", name: "avatar3"),
        StoryModel(profileImageName: "avatar4", name: "avatar4"),
        StoryModel(profileImageName: "avatar5", name: "avatar5"),
        StoryModel(profileImageName: "avatar6", name: "avatar6")
        
    ]
}
