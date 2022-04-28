//
//  FeedViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/20.
//

import UIKit

import RxSwift
import RxCocoa

class FeedViewController: UIViewController {
    
    let mainView = FeedView()
    //let viewModel = FeedViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        super.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
