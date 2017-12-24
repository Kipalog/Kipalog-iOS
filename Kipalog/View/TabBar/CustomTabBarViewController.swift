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
        let logsViewController = LogsViewController(collectionViewLayout: layout)
        let editorViewController = EditorViewController(collectionViewLayout: layout)
        let notificationsViewController = NotificationsViewController(collectionViewLayout: layout)
        let profileViewController = ProfileViewController(collectionViewLayout: layout)

        viewControllers = [
            feedViewController.buildTabController(),
            logsViewController.buildTabController(),
            editorViewController.buildTabController(),
            notificationsViewController.buildTabController(),
            profileViewController.buildTabController()
        ]
    }
}
