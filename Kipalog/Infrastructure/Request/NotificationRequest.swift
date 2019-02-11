//
//  NotificationRequest.swift
//  Kipalog
// 
//  Created by DTVD on 2019-02-11.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import Foundation
import APIKit

struct NotificationRequest {
    struct ActiveRequest: KipalogGetRequest {
        typealias Response = ActiveResponse

        var path: String {
            return "notifications"
        }
    }

    struct ActiveResponse: Codable {
        let notifications: [Notification]
    }
}