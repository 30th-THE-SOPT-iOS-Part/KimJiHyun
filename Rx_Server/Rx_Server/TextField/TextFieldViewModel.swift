//
//  TextFieldViewModel.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/18.
//

import UIKit
import RxSwift
import RxCocoa

class TextFieldViewModel {
    
    struct Input {
        let phoneNum: ControlProperty<String?>
    }

    struct Output {
        let numValidStatus: Observable<Bool>
    }
    
    var disposeBag = DisposeBag()

    func transform(input: Input) -> Output {

        let resultText = input.phoneNum
            .orEmpty
            .distinctUntilChanged()
            .map { num -> Bool in
                let phoneRegEx = "^01[0-1,6]-[0-9]{3,4}-[0-9]{4}$"
                let pred = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
                return pred.evaluate(with: num)
            }
            .share(replay: 1, scope: .whileConnected)

        return Output(numValidStatus: resultText)
    }
}
