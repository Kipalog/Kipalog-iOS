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

        let homeViewController = HomeViewController.make()

        let searchViewController = SearchViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let notificationsViewController = NotificationsViewController(collectionViewLayout: UICollectionViewFlowLayout())

        let profileViewController = ProfileViewController.make()

        viewControllers = [
            homeViewController.buildTabController(),
            searchViewController.buildTabController(),
            notificationsViewController.buildTabController(),
            profileViewController.buildTabController()
        ]

        tabBar.tintColor = UIColor.kipalog.masterColor

        if let tabBarItems = tabBar.items {
            tabBarItems[2].badgeValue = "3"
        }
    }
}
