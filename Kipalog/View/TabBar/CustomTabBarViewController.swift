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

        let feedViewController = FeedViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let searchViewController = SearchViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let notificationsViewController = NotificationsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let profileViewController = ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout())

        viewControllers = [
            feedViewController.buildTabController(),
            searchViewController.buildTabController(),
            notificationsViewController.buildTabController(),
            profileViewController.buildTabController()
        ]

        tabBar.tintColor = UIColor.kipalog.masterColor
    }
}
