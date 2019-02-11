//
//  User.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import Foundation

struct Profile: Codable {
    let kipalogCount: Int
    let commentsCount: Int
    let totalViewCount: String
    let followerCount: Int
    let followingCount: Int
}

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let handleName: String
    let avatarUrl: String?
    let profile: Profile
    let organizations: [Organization]
}

extension User {
    static var mock: User {
        return User(
            id: "1",
            name: "Vu Nhat Minh",
            email: "nhatminh179@gmail.com",
            handleName: "orakaro.targaryen",
            avatarUrl: "https://s3-ap-southeast-1.amazonaws.com/kipalog.com/dtkycrfm2t_hrlxd8Jh.png",
            profile: Profile(
                kipalogCount: 1329,
                commentsCount: 245,
                totalViewCount: "262260",
                followerCount: 866,
                followingCount: 12
            ),
            organizations: [
                Organization(
                    name: "KTMT",
                    avatarUrl: "https://ktmt.github.io/images/logo.jpg")
            ])
    }
}
