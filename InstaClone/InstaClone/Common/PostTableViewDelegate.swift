//
//  PostTableViewDelegate.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/10.
//

import UIKit

protocol PostTableViewDelegate {
    
    func contentLabelTapped(_ sender: UITapGestureRecognizer)
    func likeButtonTapped()
}
