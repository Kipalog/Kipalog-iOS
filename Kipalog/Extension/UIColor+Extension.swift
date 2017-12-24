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
}

extension UIColor {
    static var kipalog: KipalogTheme.Type {
        return KipalogTheme.self
    }
}
