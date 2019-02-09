//
//  AuthorCellViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/04.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class AuthorCellViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    var author: User? {
        didSet {
            name.text = author?.name
            if let avatarUrl = author?.avatarUrl, let url = URL(string: avatarUrl) {
                avatar.kf.setImage(
                    with: url,
                    options: [.transition(.fade(0.25))]
                )
            }
        }
    }

}
