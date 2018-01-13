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
            guard let notification = notification else { return }
            let userNameText = NSMutableAttributedString(string: notification.user.name, attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)
            ])

            let messageText = NSMutableAttributedString(string: " " + notification.message + " ", attributes: [
                NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)
            ])

            let infoText = NSMutableAttributedString(string: notification.info, attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)
            ])

            let labelText = userNameText
            labelText.append(messageText)
            labelText.append(infoText)

            infoLabel.attributedText = labelText
            dateLabel.text = notification.createdAt

            avatar.kf.setImage(
                with: notification.user.avatar_url_path,
                options: [.transition(.fade(0.25))]
            )
        }
    }

}
