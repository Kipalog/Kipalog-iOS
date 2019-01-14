//
//  PostViewModel.swift
//  Kipalog
//
//  Created by DTVD on 2019/01/05.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostViewModel: DependencyInjectable {
    typealias Dependency = Post

    var post: Post
    var url: URL? {
        return URL(string: "http://localhost:3000/posts/Toi-da-xay-dung-mot-phan-mem-ma-nguon-mo-nhu-the-nao/content?pp=disable")
    }

    required init(dependency: Post) {
        self.post = dependency
    }

    func inject(dependency: Post) {
        self.post = dependency
    }
}
