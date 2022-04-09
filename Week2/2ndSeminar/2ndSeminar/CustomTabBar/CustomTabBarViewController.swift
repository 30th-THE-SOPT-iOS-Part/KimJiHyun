//
//  CustomTabBarViewController.swift
//  2ndSeminar
//
//  Created by 김지현 on 2022/04/09.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarController()
    }
    
    // 함수 작성 - 탭바 컨트롤러 세팅
    func setTabBarController() {
        
        // 1. 스토리보드 상에 있는 뷰컨트롤러를 안전하게 가져와서 인스턴스화 하는 작업
        // - 사용할 화면, 연결할 화면 가져온 것
        guard let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstTabViewController") as? FirstTabViewController,
              let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondTabViewController") as? SecondTabViewController else { return }
        
        // 2. 탭바 아이템 설정
        firstViewController.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(named: "Home"),
            selectedImage: UIImage(named: "Home.fill")
        )
        
        secondViewController.tabBarItem = UITabBarItem(
            title: "이미지",
            image: UIImage(named: "Image"),
            selectedImage: UIImage(named: "Image.fill")
        )
        
        // 3. 연결 (화면 - 탭바 컨트롤러)
        setViewControllers([firstViewController, secondViewController], animated: true)
        
    }

}
