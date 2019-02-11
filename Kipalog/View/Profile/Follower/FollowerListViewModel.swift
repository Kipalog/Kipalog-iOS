//
//  FollowerListViewModel.swift
//  Kipalog
// 
//  Created by DTVD on 2018/01/22.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class FollowerListViewModel {
    struct DataSource {
        let users: [User]
    }

    private(set) var dataSource: Driver<DataSource>!

    init() {
        let fixtureSource = DataSource(users: [
        ])
        dataSource = Driver.just(fixtureSource)
    }
}
