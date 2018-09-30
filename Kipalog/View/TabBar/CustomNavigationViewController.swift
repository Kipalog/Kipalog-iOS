//
//  CustomNavigationViewController.swift
//  Kipalog
// 
//  Created by DTVD on 2018/01/04.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAppearance()
    }

    private func setUpAppearance() {
        navigationBar.barTintColor = UIColor.kipalog.masterColor
        navigationBar.tintColor = UIColor.white
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
    }
}
