//
//  UserMeta.swift
//  Kipalog
// 
//  Created by DTVD on 2018/01/20.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import Foundation

struct OrganizationInfo: Codable {
    let name: String
    let avatarUrl: String
}

struct UserMeta: Codable {
    let kipalogCount: Int
    let commentCount: Int
    let viewCount: Int
    let followerCount: Int
    let followingCount: Int
    let organizationInfo: OrganizationInfo?
}
