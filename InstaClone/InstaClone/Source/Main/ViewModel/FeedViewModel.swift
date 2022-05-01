//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/01.
//

import Foundation

import RxSwift
import RxCocoa

class FeedViewModel: CommonViewModel {
    
    struct Input {
        let storyModel: [StoryModel]
        let postModel: [PostModel]
    }
    
    struct Output {
        let storySampleData: Observable<[StoryModel]>
        let postSampleData: Observable<[PostModel]>
    }
    
    var disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        
        return Output(storySampleData: Observable.of(input.storyModel),
                      postSampleData: Observable.of(input.postModel))
    }
    
    
}
