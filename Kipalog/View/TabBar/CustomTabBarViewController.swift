//
//  CustomTabBarViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        let feedViewController = FeedViewController(collectionViewLayout: layout)
        let feedNavController = UINavigationController(rootViewController: feedViewController)
        feedNavController.tabBarItem.title = "Feed"

        viewControllers = [feedNavController]

    }
}
