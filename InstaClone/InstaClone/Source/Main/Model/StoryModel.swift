//
//  StoryModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/01.
//

import Foundation
import UIKit

struct StoryModel {
    
    let profileImageName: String
    let name: String
    
}

extension StoryModel {
    
    static let sampleData: [StoryModel] = [
        
        StoryModel(profileImageName: "", name: "avatar1"),
        StoryModel(profileImageName: "", name: "avatar2"),
        StoryModel(profileImageName: "", name: "avatar3"),
        StoryModel(profileImageName: "", name: "avatar4"),
        StoryModel(profileImageName: "", name: "avatar5"),
        StoryModel(profileImageName: "", name: "avatar6")
        
    ]
}
