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
    var avatarUrlPath: String?
}

struct Notification: Codable {
    let id: Int
    var source: Source
    let org: Bool
    let message: String
    let info: String
    let endpoint: String
    let status: NotificationStatus
    let createdAt: String
}

extension Source {
    private mutating func convertToSecureUrl() {
        guard let url = avatarUrlPath,
              var comps = URLComponents(string: url)
            else { return }
        comps.scheme = "https"
        avatarUrlPath = comps.string
    }

    func standardize() -> Source {
        var new = self
        new.convertToSecureUrl()
        return new
    }
}

extension Notification {
    func standardize() -> Notification {
        var new = self
        new.source = new.source.standardize()
        return new
    }
}
