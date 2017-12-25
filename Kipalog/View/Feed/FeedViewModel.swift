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
                title: "Less hay Sass",
                content: "Less hay Sass ra đời đánh dấu bước tiến hoá của CSS, mang đến sự tán thưởng trong cộng đồng front-end developer và đem lại tiện dụng ...",
                author: User(
                    id: "1",
                    name: "Vu Nhat Minh",
                    email: "nhatminh179@gmail.com",
                    handleName: "orakaro",
                    avatarUrl: URL(string: "https://pbs.twimg.com/profile_images/494654050776780802/hrlxd8Jh.png")
                )
            )
        ])
        dataSource = Driver.just(fixtureSource)
    }
}