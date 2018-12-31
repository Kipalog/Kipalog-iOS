//
//  XibViewController.swift
//  Kipalog
// 
//  Created by DTVD on 2018-12-31.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

protocol XibViewController {
    static var className: String { get }
    static func bootstrap() -> UIViewController
}

extension XibViewController where Self: UIViewController {
    static var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    static func bootstrap() -> UIViewController{
        return self.init(nibName: Self.className, bundle: nil)
    }
}

extension UIViewController: XibViewController {}

