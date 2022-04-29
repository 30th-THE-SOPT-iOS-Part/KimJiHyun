//
//  CommonViewModel.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/01.
//

import Foundation
import RxSwift

protocol CommonViewModel {
    
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
}
