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
        let postModel: [PostModel]
    }
    
    struct Output {
        let postSampleData: Observable<[PostModel]>
    }
    
    var disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        
        return Output(postSampleData: Observable.of(input.postModel))
    }
    
    
}
