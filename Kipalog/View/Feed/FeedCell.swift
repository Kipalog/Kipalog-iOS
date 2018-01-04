//
//  FeedCell.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/25.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var kipalogCount: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        containerWidthConstraint.constant = screenWidth
    }

    var post: Post? {
        didSet {
            title.text = post?.title
            title.setLineSpacing(1)

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
