//
//  ViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/21.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        let tabBarController = CustomTabBarViewController()
        embed(tabBarController, to: view)
    }

}

