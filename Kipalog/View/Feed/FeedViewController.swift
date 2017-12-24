//
//  FeedViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

class FeedViewController: UICollectionViewController, TabConvertible {
    let barTitle = "Feed"
    let barImageName = "Feed"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.brown
    }

}
