//
//  TabBarController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/20.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_home"), selectedImage: UIImage(named: "icn_home_selected"))
        let feedNavigationViewController = UINavigationController(rootViewController: feedViewController)
        
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_search"), selectedImage: UIImage(named: "icn_search_selected"))
        let searchNavigationViewController = UINavigationController(rootViewController: searchViewController)
        
        let reelsViewController = ReelsViewController()
        reelsViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_reels"), selectedImage: UIImage(named: "icn_reels_selected"))
        let reelsNavigationViewController = UINavigationController(rootViewController: reelsViewController)
        
        let shopViewController = ShopViewController()
        shopViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_shop"), selectedImage: UIImage(named: "icn_shop_selected"))
        let shopNavigationViewController = UINavigationController(rootViewController: shopViewController)
        
        let mypageViewController = MypageViewController()
        mypageViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_profile"), selectedImage: UIImage(named: "icn_profile_selected"))
        let mypageNavigationViewController = UINavigationController(rootViewController: mypageViewController)
        
        setViewControllers([feedNavigationViewController, searchNavigationViewController, reelsNavigationViewController, shopNavigationViewController, mypageNavigationViewController], animated: true)
        
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
        tabBar.isTranslucent = false
    }
}
