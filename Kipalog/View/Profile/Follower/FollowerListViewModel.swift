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
            User(
                id: "5",
                name: "Huy Tran",
                email: "huytran@gmail.com",
                handleName: "huytran",
                avatarUrl: "https://pbs.twimg.com/media/C1OsxXCWgAEy1F_.png"
            ),
            User(
                id: "3",
                name: "Bui Hong Ha",
                email: "habuihong@gmail.com",
                handleName: "telescreen",
                avatarUrl: "https://avatars.githubusercontent.com/u/181202?v=3"
            ),
            User(
                id: "2",
                name: "Do Xuan Huy",
                email: "huydx@gmail.com",
                handleName: "huydx",
                avatarUrl: "https://orig05.deviantart.net/a1df/f/2011/112/8/f/nyan_cat_gif_by_kodiakpaws-d3emqu1.gif"
            ),
        ])
        dataSource = Driver.just(fixtureSource)
    }
}
