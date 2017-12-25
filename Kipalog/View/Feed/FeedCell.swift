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
    @IBOutlet weak var title: UITextView!
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        containerWidthConstraint.constant = screenWidth - 24
    }

}
