//
//  File.swift
//  
//
//  Created by 宗像恒 on 2023/03/18.
//

import Foundation
import UIKit

public class LinkTextView: UITextView {
  
    
    override init(frame: CGRect, textContainer: NSTextContainer? = nil) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    public func setUp(displayText: String = "Google is here", linkText: String = "here", url: URL = URL(string: "https://www.google.com")!) {
        let range = (displayText as NSString).range(of: linkText)
        let attrText: NSMutableAttributedString = .init(string: displayText)
        attrText.addAttribute(.link, value: url, range: NSRange(location: 0, length: displayText.count))
        self.attributedText = .init(string: displayText)
        self.isSelectable = true
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
