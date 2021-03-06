//
//  UIColor+Extension.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

struct KipalogTheme {
    static var masterColor: UIColor {
        return UIColor(red: 44/255, green: 71/255, blue: 98/255, alpha: 1)
    }
    static var tearColor: UIColor {
        return UIColor(red: 0/255, green: 181/255, blue: 173/255, alpha: 1)
    }
    static var greyColor: UIColor {
        return UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
    }
    static var textColor: UIColor {
        return UIColor(red: 125/255, green: 125/255, blue: 125/255, alpha: 1)
    }
}

extension UIColor {
    static var kipalog: KipalogTheme.Type {
        return KipalogTheme.self
    }
}
