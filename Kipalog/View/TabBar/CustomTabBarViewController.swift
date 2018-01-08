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

//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let homeViewController = storyboard.instantiateInitialViewController() as! HomeViewController

        let storyboard = UIStoryboard(name: "Feed", bundle: nil)
        let feedViewController = storyboard.instantiateInitialViewController() as! FeedViewController

        let searchViewController = SearchViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let editorViewController = EditorViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let notificationsViewController = NotificationsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let profileViewController = ProfileViewController(collectionViewLayout: UICollectionViewFlowLayout())

        viewControllers = [
            feedViewController.buildTabController(),
            searchViewController.buildTabController(),
            editorViewController.buildTabController(),
            notificationsViewController.buildTabController(),
            profileViewController.buildTabController()
        ]

        tabBar.tintColor = UIColor.kipalog.masterColor
    }
}
