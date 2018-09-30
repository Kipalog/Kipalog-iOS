//
//  UILabel+Extension.swift
//  Kipalog
// 
//  Created by DTVD on 2018/01/04.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

extension UILabel {
    func setLineSpacing(_ value: CGFloat) {
        guard let labelText = text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.0
        paragraphStyle.lineSpacing = value

        let attributedString: NSMutableAttributedString
        if let labelAttributedText = attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
            value:paragraphStyle,
            range:NSMakeRange(0, attributedString.length)
        )

        attributedText = attributedString
    }
}
