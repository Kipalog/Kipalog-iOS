//
//  ViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/21.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    private(set) var contentViewController: CustomTabBarViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
//        setup()
        displayLogin()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func setup() {
        let tabBarController = CustomTabBarViewController()
        contentViewController = tabBarController
        embed(tabBarController, to: view)
    }

    private func displayLogin() {
        let loginViewController = LoginViewController.make()
        let navViewController = KipalogNavigationController(rootViewController: loginViewController)
        embed(navViewController, to: view)
    }
}

