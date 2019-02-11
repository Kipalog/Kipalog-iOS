//
//  CustomTabBarViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit
import RxSwift

class CustomTabBarViewController: UITabBarController {

    private let api = NotificationAPI()
    private let disposeBag = DisposeBag()

    private let homeViewController = HomeViewController.make()
    private let searchViewController = SearchViewController(collectionViewLayout: UICollectionViewFlowLayout())
    private let notificationsViewController = NotificationsViewController(collectionViewLayout: UICollectionViewFlowLayout())
    private let profileViewController = ProfileViewController.make()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        api.getActive()
            .asDriver(onErrorDriveWith: .empty())
            .drive(onNext: { [notificationsViewController, tabBar] notifications in
                let notificationCounts = notifications.filter { $0.status == .unchecked }.count
                if let tabBarItems = tabBar.items, notificationCounts > 0 {
                    tabBarItems[2].badgeValue = String(notificationCounts)
                }
                notificationsViewController.inject(dependency: notifications)
            })
            .disposed(by: disposeBag)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            homeViewController.buildTabController(),
            searchViewController.buildTabController(),
            notificationsViewController.buildTabController(),
            profileViewController.buildTabController()
        ]

        tabBar.tintColor = UIColor.kipalog.masterColor
    }
}
