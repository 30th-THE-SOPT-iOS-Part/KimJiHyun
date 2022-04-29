//
//  FeedViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/20.
//

class FeedViewController: BaseViewController {
    
    let mainView = FeedView()
    //let viewModel = FeedViewModel()
    
    override func loadView() {
        super.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
