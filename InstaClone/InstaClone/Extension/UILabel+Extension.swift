//
//  UILabel+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/05.
//

import UIKit

extension UILabel {
    
    func calRectForSpecificRange(subString: String) -> CGRect? {
            
            // NSTextStorage >> NSLayoutManager >> NSTextContainer >> View
            
            // NSTextStorage는 텍스트와 속성 정보를 저장하므로 label.textd의 attributedText로 생성
            guard let attributedText = self.attributedText else { return nil }
            let textStorage = NSTextStorage(attributedString: attributedText)
            
            // textStorage에게 layoutManager를 붙여줍니다
            let layoutManager = NSLayoutManager()
            textStorage.addLayoutManager(layoutManager)
            
            // NSTextContainer은 size로 생성할 수 있다. size는 Label의 IntrinsicContentSize로
            let textContainer = NSTextContainer(size: bounds.size)
            textContainer.lineFragmentPadding = 0.0 // default 5.0
            
            // layoutManager을 기반으로 생성되어야 하는 컨테이너를 추가해준다
            layoutManager.addTextContainer(textContainer)
            
            // container 내에서 특정 character범위의 영역을 구한다.
            guard let text = self.text,
                  let subRange = text.range(of: subString) else { return nil }
            let range = NSRange(subRange, in: text)
            return layoutManager.boundingRect(forGlyphRange: range, in: textContainer)
        }
}
