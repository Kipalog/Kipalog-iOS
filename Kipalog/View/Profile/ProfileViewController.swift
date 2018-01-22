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
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var orgAvatar: UIImageView!
    @IBOutlet weak var orgName: UILabel!

    struct Profile {
        let user: User
        let userMeta: UserMeta
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Hồ sơ cá nhân"
        let profile = Profile (
            user: User(
                id: "1",
                name: "Vu Nhat Minh",
                email: "nhatminh179@gmail.com",
                handleName: "Orakaro",
                avatarUrl: URL(string: "https://s3-ap-southeast-1.amazonaws.com/kipalog.com/dtkycrfm2t_hrlxd8Jh.png")
            ),
            userMeta: UserMeta(
                kipalogCount: 1121,
                commentCount: 214,
                viewCount: 175207,
                followerCount: 714,
                followingCount: 12,
                organizationInfo: OrganizationInfo(
                    name: "KTMT",
                    avatarUrl: URL(string: "https://ktmt.github.io/images/logo.jpg")!
                )
            )
        )
        setupDisplay(profile)
    }

    private func setupDisplay(_ profile: Profile) {

        avatar.kf.setImage(
            with: profile.user.avatarUrl
        )
        if let avatarUrl = profile.userMeta.organizationInfo?.avatarUrl {
            orgAvatar.kf.setImage(
                with: avatarUrl
            )
        }
        nameLabel.text = profile.user.name
        kipalogLabel.text = String(profile.userMeta.kipalogCount)
        commentLabel.text = String(profile.userMeta.commentCount)
        viewLabel.text = String(profile.userMeta.viewCount)
        followerCountLabel.text = String(profile.userMeta.followerCount) + " người theo dõi"
        followingCountLabel.text = "Theo dõi " + String(profile.userMeta.followingCount) + " người"
        orgName.text = profile.userMeta.organizationInfo?.name
    }

}

extension ProfileViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
