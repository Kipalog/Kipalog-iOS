//
//  NotificationAPI.swift
//  Kipalog
// 
//  Created by DTVD on 2019-02-11.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import Foundation
import APIKit
import RxSwift

struct NotificationAPI {
    func getActive() -> Observable<[Notification]> {
        return Session.send(request: NotificationRequest.ActiveRequest())
            .map { response in 
                return response.notifications.map { $0.standardize() }
            }
    }
}