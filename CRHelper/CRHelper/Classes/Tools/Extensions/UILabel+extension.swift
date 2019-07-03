//
//  UILabel+extension.swift
//  MySinaWeibo
//
//  Created by Stephen Cao on 5/4/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
extension UILabel{
    
    ///
    /// add: placeholderLabel.isHidden = !textView.text.isEmpty in textViewDidChange
    /// - Parameters:
    ///   - textView: label's parent view
    ///   - placeholderString: placeholder string
    func setPlaceholderLabel(textView: UITextView,placeholderString: String){
        self.text = placeholderString
        self.font = UIFont.italicSystemFont(ofSize: (textView.font?.pointSize)!)
        self.sizeToFit()
        self.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        self.textColor = UIColor.lightGray
        self.isHidden = !textView.text.isEmpty
    }
}
