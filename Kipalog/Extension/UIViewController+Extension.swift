//
//  UIViewController+Extension.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

extension UIViewController {
    func embed(_ childViewController: UIViewController, to parentView: UIView) {
        childViewController.view.frame = parentView.bounds
        parentView.addSubview(childViewController.view)
        addChildViewController(childViewController)
        childViewController.didMove(toParentViewController: self)
    }
}