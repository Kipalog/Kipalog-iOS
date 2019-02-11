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

class NotificationViewModel: DependencyInjectable {
    struct DataSource {
        let notifications: [Notification]
    }

    private(set) var dataSource: Driver<DataSource>!
    private let api = NotificationAPI()
    private let trigger = PublishRelay<[Notification]>()

    required init(dependency: [Notification]) {
        dataSource = trigger
            .asDriver(onErrorDriveWith: .empty())
            .filter { !$0.isEmpty }
            .map { DataSource(notifications: $0) }
        trigger.accept(dependency)
    }

    func inject(dependency : [Notification]) {
        trigger.accept(dependency)
    }
}
