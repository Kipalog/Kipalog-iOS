//
//  User.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let handleName: String
    let avatarUrl: String?
    let kipalogCount: Int
    let commentsCount: Int
    let totalViewCount: String
    let followerCount: Int
    let followingCount: Int
    let organizations: [Organization]

    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case email
        case handleName
        case avatarUrl
        case kipalogCount = "likeToMyPostCount"
        case commentsCount = "commentToMyPostCount"
        case totalViewCount
        case followerCount
        case followingCount
        case organizations
    }
}

extension User {
    static var mock: User {
        return User(
            id: "1",
            name: "Vu Nhat Minh",
            email: "nhatminh179@gmail.com",
            handleName: "orakaro.targaryen",
            avatarUrl: "https://s3-ap-southeast-1.amazonaws.com/kipalog.com/dtkycrfm2t_hrlxd8Jh.png",
            kipalogCount: 1329,
            commentsCount: 245,
            totalViewCount: "262260",
            followerCount: 866,
            followingCount: 12,
            organizations: [
                Organization(
                    name: "KTMT",
                    avatarUrl: "https://ktmt.github.io/images/logo.jpg")
            ])
    }
}
