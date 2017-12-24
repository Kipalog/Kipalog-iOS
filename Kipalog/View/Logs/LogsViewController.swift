//
//  LogsViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

class LogsViewController: UICollectionViewController, TabConvertible {
    let barTitle = "Logs"
    let barImageName = "Logs"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.cyan
    }

}
