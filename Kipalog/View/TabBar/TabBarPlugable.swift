//
//  TabBarPlugable.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

protocol TabConvertible {
    var barTitle: String { get }
    var barImageName: String { get }
    func buildTabController() -> UIViewController
}

extension TabConvertible where Self: UIViewController {
    func buildTabController() -> UIViewController {
        let navController = UINavigationController(rootViewController: self)
        navController.tabBarItem.title = barTitle
        navController.tabBarItem.image = UIImage(named: barImageName)
        return navController
    }
}
