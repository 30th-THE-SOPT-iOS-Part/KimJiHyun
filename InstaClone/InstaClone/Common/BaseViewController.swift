//
//  BaseViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/01.
//

import UIKit

import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        binding()
    }
    
    func configureUI() {
        
        view.backgroundColor = .white
    }
    
    func binding() {
    
    }
    
}
