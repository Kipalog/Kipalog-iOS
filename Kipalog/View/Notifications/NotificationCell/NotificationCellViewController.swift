//
//  NotificationCellViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/13.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class NotificationCellViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var baseView: UIView!
    
    static let identifier = "NotificationCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        containerWidthConstraint.constant = screenWidth
    }

    var notification: Notification? {
        didSet {
            guard let notification = notification else { return }
            let userNameText = NSMutableAttributedString(string: notification.source.name, attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)
            ])

            let messageText = NSMutableAttributedString(string: " " + notification.message + " ", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
            ])

            let infoText = NSMutableAttributedString(string: notification.info, attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)
            ])

            let labelText = userNameText
            labelText.append(messageText)
            labelText.append(infoText)

            infoLabel.attributedText = labelText
            dateLabel.text = notification.createdAt

            if let url = notification.source.avatarUrlPath {
                avatar.kf.setImage(
                    with: URL(string: url),
                    options: [.transition(.fade(0.25))]
                )
            }

            if notification.status != .checked {
                baseView.backgroundColor = UIColor.kipalog.greyColor
            }
        }
    }

}
