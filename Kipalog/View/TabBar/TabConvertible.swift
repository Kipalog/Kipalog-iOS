//
//  TabConvertible.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

protocol TabConvertible {
    var barImageName: String { get }
    func buildTabController() -> UIViewController
}

extension TabConvertible where Self: UIViewController {
    func buildTabController() -> UIViewController {
        let navController = KipalogNavigationController(rootViewController: self)
        navController.tabBarItem.image = UIImage(named: barImageName)
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        return navController
    }
}
