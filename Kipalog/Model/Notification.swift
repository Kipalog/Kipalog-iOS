//
//  Notification.swift
//  Kipalog
// 
//  Created by DTVD on 2018/01/13.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import Foundation

enum NotificationStatus {
    case unchecked
    case saw
    case checked
}

struct NotificationUser {
    let name: String
    let avatar_url_path: URL
}

struct Notification {
    let id: Int
    let user: NotificationUser
    let org: Bool
    let message: String
    let info: String
    let endpoint: URL
    let status: NotificationStatus
    let createdAt: String
}
