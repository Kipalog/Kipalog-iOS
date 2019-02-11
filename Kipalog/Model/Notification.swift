//
//  Notification.swift
//  Kipalog
// 
//  Created by DTVD on 2018/01/13.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import Foundation

enum NotificationStatus: String, Codable {
    case unchecked
    case saw
    case checked
}

struct Source: Codable {
    let name: String
    let avatarUrlPath: String
}

struct Notification: Codable {
    let id: Int
    let source: Source
    let org: Bool
    let message: String
    let info: String
    let endpoint: String
    let status: NotificationStatus
    let createdAt: String
}
