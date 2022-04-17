//
//  UINavigationController+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/17.
//

import UIKit

extension UINavigationController {
    
    func initializeNavigationBarWithBackButton(navigationItem: UINavigationItem) {

        navigationBar.barTintColor = .white
        navigationBar.isTranslucent = false
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(tapBackButton))
        backButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func tapBackButton() {
        self.popViewController(animated: true)
    }
    
    func initializeNavigationBarWithoutBackButton(navigationItem: UINavigationItem) {

        navigationBar.barTintColor = .white
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
}
