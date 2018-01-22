//
//  FollowerCell.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/22.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!

    static let identifier = "FollowerCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        containerWidthConstraint.constant = screenWidth
    }

    var user: User? {
        didSet {
            nameLabel.text = user?.name
            if let url = user?.avatarUrl {
                avatar.kf.setImage(
                    with: url,
                    options: [.transition(.fade(0.25))]
                )
            }
        }
    }

}
