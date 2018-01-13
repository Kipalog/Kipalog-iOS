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
                status: .unchecked,
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
                status: .saw,
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
                status: .saw,
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
            Notification(
                id: 245880,
                user: NotificationUser(
                    name: "Phạm Huy",
                    avatar_url_path: URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-1/s100x100/19511312_10207175912395502_2036453742012401103_n.jpg?oh=1feedb0536c9a4d882c8bf6bacf77b3c&oe=5AFD9FF7")!
                ),
                org: false,
                message: "đã bình luận bài viết của bạn",
                info: "The Monty Hall Problem",
                endpoint: URL(string: "/posts/cc58oyHu_IRnHeFjzf1WLw#cmts")!,
                status: .checked,
                createdAt: "8 ngày"
            ),
            Notification(
                id: 245851,
                user: NotificationUser(
                    name: "Ngô Hiếu",
                    avatar_url_path: URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-1/p100x100/25507903_1520138038040185_3460735976440446720_n.jpg?oh=3a264c18d37235b7fc91bb91953004dd&oe=5AF1E293")!
                ),
                org: false,
                message: "đã follow bạn.",
                info: "",
                endpoint: URL(string: "/users/NgoHieu1/mypage")!,
                status: .checked,
                createdAt: "9 ngày"
            ),
            Notification(
                id: 245842,
                user: NotificationUser(
                    name: "Lương Ngọc Phú",
                    avatar_url_path: URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-1/p100x100/17553836_1175759975866382_4185158795777329152_n.jpg?oh=06e32f321e9d5bc8822ae4a279b32d67&oe=5AE5436F")!
                ),
                org: false,
                message: "đã follow bạn.",
                info: "",
                endpoint: URL(string: "/users/LuongNgocPhu/mypage")!,
                status: .checked,
                createdAt: "9 ngày"
            ),
            Notification(
                id: 245780,
                user: NotificationUser(
                    name: "Linh Lê",
                    avatar_url_path: URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-1/p100x100/13012685_634160786731295_2174880575869215799_n.jpg?oh=2f8fc3bf537246eb2dfee138d281d98b&oe=5AFA8E5A")!
                ),
                org: false,
                message: "đã follow bạn.",
                info: "",
                endpoint: URL(string: "/users/LinhLe1/mypage")!,
                status: .checked,
                createdAt: "10 ngày"
            ),
            Notification(
                id: 243726,
                user: NotificationUser(
                    name: "Nguyen Quang Phuong",
                    avatar_url_path: URL(string: "https://kipalog.com/assets/common/male_avatar-f0133698a204bbc1684476efffe76f51.png")!
                ),
                org: false,
                message: "đã viết bài viết mới",
                info: "Làm chủ Bitcoin - Chương 1 - Phần 1",
                endpoint: URL(string: "/posts/0I4ctmrnJ0V_SfhGqtI9eQ")!,
                status: .checked,
                createdAt: "18 ngày"
            ),
        ])
        dataSource = Driver.just(fixtureSource)
    }
}
