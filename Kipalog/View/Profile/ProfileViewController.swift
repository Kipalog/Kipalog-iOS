//
//  ProfileViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/20.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController, TabConvertible {
    let barImageName = "Profile"

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kipalogLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var orgAvatar: UIImageView!
    @IBOutlet weak var orgName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Hồ sơ cá nhân"
        avatar.kf.setImage(
            with: URL(string: "https://s3-ap-southeast-1.amazonaws.com/kipalog.com/dtkycrfm2t_hrlxd8Jh.png")!
        )
        orgAvatar.kf.setImage(
            with: URL(string: "https://ktmt.github.io/images/logo.jpg")!
        )
    }

}

extension ProfileViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
