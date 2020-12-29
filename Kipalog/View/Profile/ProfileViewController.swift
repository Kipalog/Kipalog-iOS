//
//  ProfileViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/20.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileViewController: UITableViewController, DependencyInjectable, TabConvertible {
    let barImageName = "Profile"
    private var user: User

    @IBOutlet var followersCell: UITableViewCell!
    @IBOutlet var followingCell: UITableViewCell!
    @IBOutlet var orgCell: UITableViewCell!

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kipalogLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var orgAvatar: UIImageView!
    @IBOutlet weak var orgName: UILabel!

    required init(dependency: User) {
        self.user = dependency
        super.init(nibName: ProfileViewController.className, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.user = User.mock // TODO: Replace with current user after implement Login
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    func inject(dependency: User) {
        self.user = dependency
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Hồ sơ cá nhân"
        setupDisplay(user)
    }

    private func setupDisplay(_ user: User) {

        if let avatarUrl = user.avatarUrl, let url = URL(string: avatarUrl) {
            avatar.kf.setImage(
                with: url
            )
        } else if let avatarUrl = user.organizations.first?.avatarUrl, let url = URL(string: avatarUrl) {
            orgAvatar.kf.setImage(
                with: url
            )
        } else {
            avatar.image = UIImage(named: "MaleAvatar")
        }
        let profile = user.profile
        nameLabel.text = user.name
        kipalogLabel.text = String(profile.kipalogCount)
        commentLabel.text = String(profile.commentsCount)
        viewLabel.text = profile.totalViewCount
        followerCountLabel.text = String(profile.followerCount) + " người theo dõi"
        followingCountLabel.text = "Theo dõi " + String(profile.followingCount) + " người"
        orgName.text = user.organizations.first?.name
    }

}

extension ProfileViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FollowerListViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return followersCell
        case 1:
            return followingCell
        case 2:
            return orgCell
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0, 1:
            return 60.0
        case 2:
            return 110.0
        default:
            return 0.0
        }
    }
}
