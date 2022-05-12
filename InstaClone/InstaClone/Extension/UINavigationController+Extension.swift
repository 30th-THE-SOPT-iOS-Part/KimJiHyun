//
//  UINavigationController+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/17.
//

import UIKit

extension UINavigationController {
    
    private var titleAttributes: [NSAttributedString.Key : Any] {
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        
        return attributes
    }
    
    func initNavigationBarWithBackButton(navigationItem: UINavigationItem) {

        navigationBar.barTintColor = .white
        navigationBar.titleTextAttributes = titleAttributes
        
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(tapBackButton))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }
    
    func initNavigationBarWithoutBackButton(navigationItem: UINavigationItem) {

        navigationBar.barTintColor = .white
        navigationBar.titleTextAttributes = titleAttributes
    }
    
    @objc func tapBackButton() {
        self.popViewController(animated: true)
    }
}

extension UINavigationController {
    
    func addBarButtonItems(navigationItem: UINavigationItem, buttonArray: [UIButton], isRight: Bool = true) {
        
        let stackview = UIStackView(arrangedSubviews: buttonArray)
        let barButton = UIBarButtonItem(customView: stackview.horizontalSpacing)
        isRight ? (navigationItem.rightBarButtonItem = barButton) : (navigationItem.leftBarButtonItem = barButton)
    }
}
