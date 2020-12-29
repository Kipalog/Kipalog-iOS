//
//  FeedCellViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/12/31.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class FeedCellViewController: UIViewController, Reusable {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var kipalogCount: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        containerWidthConstraint.constant = screenWidth
    }

    var post: Post? {
        didSet {
            postTitle.text = post?.title
            postTitle.setLineSpacing(1)

            detail.text = post?.preview
            detail.setLineSpacing(3)

            if let avatarUrl = post?.author.avatarUrl, let url = URL(string: avatarUrl) {
                avatar.kf.setImage(
                    with: url,
                    options: [.transition(.fade(0.25))]
                )
            } else {
                avatar.image = Asset.maleAvatar.image
            }

            kipalogCount.text = post.map{ String($0.meta.kipalogCount) }
            commentCount.text = post.map{ String($0.meta.commentsCount) }
        }
    }

}
