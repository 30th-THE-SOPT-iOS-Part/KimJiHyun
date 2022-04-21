//
//  TabBarController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/20.
//

import UIKit

import RxSwift
import RxCocoa

final class TabBarController: UITabBarController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        configureBasicUI()
    }
    
    func setUp() {
        
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
    }
    
    func configureBasicUI() {
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
        tabBar.isTranslucent = false
    }
    
    func configureDarkUI() {
        
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
        tabBar.isTranslucent = false
    }
}

extension TabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard let items = tabBar.items else { return }
        
        item == items[2] ? configureDarkUI() : configureBasicUI()
    }
}
