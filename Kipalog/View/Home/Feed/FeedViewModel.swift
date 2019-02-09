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
    private let api = FeedAPI()

    init() {
        let fixtureSource = DataSource(posts: [
            Post(
                title: "Less hay Sass",
                detail: "Less hay Sass ra đời đánh dấu bước tiến hoá của CSS, mang đến sự tán thưởng trong cộng đồng front-end developer và đem lại tiện dụng ...",
                author: User(
                    id: "1",
                    name: "Vu Nhat Minh",
                    email: "nhatminh179@gmail.com",
                    handleName: "orakaro",
                    avatarUrl: URL(string: "https://pbs.twimg.com/profile_images/494654050776780802/hrlxd8Jh.png")
                ),
                kipalogCount: 5,
                commentsCount: 8
            ),
            Post(
                title: "Cơ bản về Rails",
                detail: "Rails được xem là chuẩn của web framework hiện đại, mang những design pattern mẫu mực và sắp xếp tổ chức khoa học, chặt chẽ ...",
                author: User(
                    id: "2",
                    name: "Do Xuan Huy",
                    email: "huydx@gmail.com",
                    handleName: "huydx",
                    avatarUrl: URL(string: "https://orig05.deviantart.net/a1df/f/2011/112/8/f/nyan_cat_gif_by_kodiakpaws-d3emqu1.gif")
                ),
                kipalogCount: 1,
                commentsCount: 3
            ),
            Post(
                title: "Cách cài đặt Docker trên Digital Ocean",
                detail: "Docker - dịch vụ mới nhưng cũng không mới, kết hợp với một IaaS mới nổi tạo nên cơn sốt trong các công ty startup ...",
                author: User(
                    id: "3",
                    name: "Bui Hong Ha",
                    email: "habuihong@gmail.com",
                    handleName: "telescreen",
                    avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/181202?v=3")
                ),
                kipalogCount: 9,
                commentsCount: 16
            ),
            Post(
                title: "OpenCV cơ bản đến nâng cao",
                detail: "Làm khoa học về xử lỹ hình ảnh, chắc hẳn bạn không thể không biết đến Python và OpenCV. Trong bài biết này mình xin trình bày ngắn gọn về ...",
                author: User(
                    id: "4",
                    name: "Viet Nguyen Hoang",
                    email: "vietnguyenhoang@gmail.com",
                    handleName: "vietnguyen",
                    avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/2935719")
                ),
                kipalogCount: 8,
                commentsCount: 2
            ),
            Post(
                title: "Phân tích và tiếp cận bài toán Quy hoạch động",
                detail: "Với sự hỗ trợ của anh (Link) (là dân competitive programming thứ thiệt (Link)] ) cùng với các anh em trong nhóm algorithm (Link)] của (Link), mình ...",
                author: User(
                    id: "5",
                    name: "Huy Tran",
                    email: "huytran@gmail.com",
                    handleName: "huytran",
                    avatarUrl: URL(string: "https://pbs.twimg.com/media/C1OsxXCWgAEy1F_.png")
                ),
                kipalogCount: 15,
                commentsCount: 0
            ),
        ])
//        dataSource = Driver.just(fixtureSource)
        dataSource = api.getFeed(for: .top)
            .asDriver(onErrorDriveWith: .empty())
            .map { posts in DataSource(posts: posts) }
    }
}
