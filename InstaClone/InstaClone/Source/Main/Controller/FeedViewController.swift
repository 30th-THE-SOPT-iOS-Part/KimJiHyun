//
//  FeedViewController.swift
//  InstaClone
//
//  Created by 김지현 on 2022/04/20.
//

import RxSwift

class FeedViewController: BaseViewController {
    
    let mainView = FeedView()
    let viewModel = FeedViewModel()
    
    override func loadView() {
        super.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func binding() {
        
        let input = FeedViewModel.Input(storyModel: StoryModel.sampleData, postModel: PostModel.sampleData)
        let output = viewModel.transform(input: input)
        
        output.storySampleData.bind(to: mainView.storyCollectionView.rx.items(
            cellIdentifier: StoryCollectionViewCell.identifier, cellType: StoryCollectionViewCell.self)) { (row, element, cell) in
                
                
                
            }
            .disposed(by: disposeBag)
        
        output.postSampleData.bind(to: mainView.feedTableView.rx.items(
            cellIdentifier: FeedTableViewCell.identifier, cellType: FeedTableViewCell.self)) { (row, element, cell) in
                
                cell.label.text = element.name
                print(element.name)
            }
            .disposed(by: disposeBag)
    }
    
}
