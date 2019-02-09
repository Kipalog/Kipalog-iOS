//
//  FollowerCellViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/22.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class FollowerCellViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        containerWidthConstraint.constant = screenWidth
    }

    var user: User? {
        didSet {
            nameLabel.text = user?.name
            if let avatarUrl = user?.avatarUrl, let url = URL(string: avatarUrl) {
                avatar.kf.setImage(
                    with: url,
                    options: [.transition(.fade(0.25))]
                )
            }
        }
    }

}
