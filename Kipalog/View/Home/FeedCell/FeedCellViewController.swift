//
//  FeedCellViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/12/31.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class FeedCellViewController: UIViewController {

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

            detail.text = post?.detail
            detail.setLineSpacing(3)

            if let url = post?.author.avatarUrl {
                avatar.kf.setImage(
                    with: url,
                    options: [.transition(.fade(0.25))]
                )
            }

            kipalogCount.text = post.map{ String($0.meta.kipalogCount) }
            commentCount.text = post.map{ String($0.meta.commentCount) }
        }
    }

}
