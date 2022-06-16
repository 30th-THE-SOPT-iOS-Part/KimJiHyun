//
//  UITextField+.swift
//  Rx_Server
//
//  Created by 김지현 on 2022/05/18.
//

import UIKit
import AnyFormatKit

extension UITextField {
    
    func formatPhoneNumber(range: NSRange, string: String) {
        
        guard let text = self.text else {
            return
        }
        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return
        }
        
        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
        let result = formatter.formatInput(currentText: text, range: range, replacementString: string)
        self.text = result.formattedText
        let position = self.position(from: self.beginningOfDocument, offset: result.caretBeginOffset)!
        self.selectedTextRange = self.textRange(from: position, to: position)

    }
    
}
