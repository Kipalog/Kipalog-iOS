//
//  NotificationsViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

class NotificationsViewController: UICollectionViewController, TabConvertible {
    let barTitle = "Notifications"
    let barImageName = "Notifications"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.blue
    }

}
