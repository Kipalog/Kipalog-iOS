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
        let fixtureSource = DataSource(notifications: [
            Notification(
                id: 248889,
                user: NotificationUser(
                    name: "ThAh Ca",
                    avatar_url_path: URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-1/p100x100/10580057_728864467210598_3039877017327880161_n.jpg?oh=2b9c843ae09deced2a26048bfc0135b7&oe=5AE6B6F9")!
                ),
                org: false,
                message: "cũng đã bình luận vào bài viết",
                info: "Share framework data-binding mình tự viết.",
                endpoint: URL(string: "/posts/gQwo9qEwIQX1PtctmpsNqA#cmts")!,
                status: .checked,
                createdAt: "14 giờ"
            ),
            Notification(
                id: 248859,
                user: NotificationUser(
                    name: "Bảo Nghĩa Nghĩa",
                    avatar_url_path: URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-1/p100x100/25348634_729102350634289_5178661017843948220_n.jpg?oh=e6f6042f02abbbc3c9034a983b4d120d&oe=5ADFEB5F")!
                ),
                org: false,
                message: "đã follow bạn.",
                info: "",
                endpoint: URL(string: "/users/BaoNghiaNghia/mypage")!,
                status: .checked,
                createdAt: "23 giờ"
            ),
            Notification(
                id: 247512,
                user: NotificationUser(
                    name: "huydx",
                    avatar_url_path: URL(string: "https://orig05.deviantart.net/a1df/f/2011/112/8/f/nyan_cat_gif_by_kodiakpaws-d3emqu1.gif")!
                ),
                org: false,
                message: "đã viết bài viết mới",
                info: "Practical story about Trie and Prefix Search",
                endpoint: URL(string: "/posts/0xEJhIJix5IUi70C6yhudw")!,
                status: .checked,
                createdAt: "5 ngày"
            ),
            Notification(
                id: 245958,
                user: NotificationUser(
                    name: "monkeydragon",
                    avatar_url_path: URL(string: "https://upload.wikimedia.org/wikipedia/vi/thumb/f/f5/Monkey_D._Dragon_Anime_Infobox.png/220px-Monkey_D._Dragon_Anime_Infobox.png")!
                ),
                org: false,
                message: "đã follow bạn.",
                info: "",
                endpoint: URL(string: "/users/monkeydragon/mypage")!,
                status: .checked,
                createdAt: "8 ngày"
            ),
        ])
        dataSource = Driver.just(fixtureSource)
    }
}
