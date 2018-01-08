//
//  HomeViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/08.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, TabConvertible {
    var barImageName: String = "Feed"

    @IBOutlet weak var feedContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Kipalog"
        embedContainer()
    }

    private func embedContainer() {
        let storyboard = UIStoryboard(name: "Feed", bundle: nil)
        let feedViewController = storyboard.instantiateInitialViewController() as! FeedViewController
        embed(feedViewController, to: feedContainer)
    }

}
