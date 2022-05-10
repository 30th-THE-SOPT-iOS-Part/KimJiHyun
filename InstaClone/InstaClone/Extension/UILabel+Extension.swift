//
//  UILabel+Extension.swift
//  InstaClone
//
//  Created by 김지현 on 2022/05/05.
//

import UIKit

extension UILabel {
    
    func calRectForSpecificRange(subString: String) -> CGRect? {
        
        //guard let attributedText = attributedText else { return }
        guard let text = self.text,
              let subRange = text.range(of: subString) else { return nil }
        let range = NSRange(subRange, in: text)
        
        // NSTextStorage >> NSLayoutManager >> NSTextContainer
        
        // 1. UILabel의 attributedText를 가지고 있는 NSTextStorage를 생성한다
        // 2. 생성한 NSTextStorage에 LayoutManager를 추가해준다
        // 3. UILabel의 intrinsicContentSize 만큼의 NSTextContainer를 생성해준다
        // 4. LayoutManager에 생성한 NSTextContainer를 추가해준다.
        // 5. 실질적인 범위를 구하기 위해 characterRange를 통해 포인터 지정 !
        // 6. LayoutManager에 저장되어있는 textContainer 중 실 포인터 CGRect를 리턴해준다
        
        guard let attributedText = self.attributedText else { return nil }
        let layoutManager = NSLayoutManager()
        let textStorage = NSTextStorage(attributedString: attributedText)
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer(size: intrinsicContentSize)
        textContainer.lineFragmentPadding = 0.0
        layoutManager.addTextContainer(textContainer)
        
        var glyphRange = NSRange()
        layoutManager.characterRange(forGlyphRange: range, actualGlyphRange: &glyphRange)
        
        return layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
    }
}
