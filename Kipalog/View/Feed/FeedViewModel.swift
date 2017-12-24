//
//  FeedViewModel.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class FeedViewModel {
    struct DataSource {
        let posts: [Post]
    }

    private(set) var dataSource: Driver<DataSource>!

    init() {
        let fixtureSource = DataSource(posts: [
            Post(
                status: .publish,
                title: "title",
                content: "content",
                author: User(
                    id: "1",
                    name: "Vu Nhat Minh",
                    email: "nhatminh179@gmail.com",
                    handleName: "orakaro",
                    avatarUrl: URL(string: "")
                )
            )
        ])
        dataSource = Driver.just(fixtureSource)
    }
}