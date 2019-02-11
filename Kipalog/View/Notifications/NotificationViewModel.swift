//
//  NotificationViewModel.swift
//  Kipalog
// 
//  Created by DTVD on 2018/01/13.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class NotificationViewModel {
    struct DataSource {
        let notifications: [Notification]
    }

    private(set) var dataSource: Driver<DataSource>!

    init() {
        let fixtureSource = DataSource(notifications: [])
        dataSource = Driver.just(fixtureSource)
    }
}
