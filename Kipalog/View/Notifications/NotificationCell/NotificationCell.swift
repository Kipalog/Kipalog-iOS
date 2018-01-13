//
//  NotificationCell.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/13.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class NotificationCell: UICollectionViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!
    
    static let identifier = "NotificationCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        containerWidthConstraint.constant = screenWidth
    }

    var notification: Notification? {
        didSet {
            infoLabel.text = notification.map{ $0.user.name + " " + $0.message + " " + $0.info }
            dateLabel.text = notification?.createdAt
            if let url = notification?.user.avatar_url_path {
                avatar.kf.setImage(
                    with: url,
                    options: [.transition(.fade(0.25))]
                )
            }
        }
    }

}
