//
//  PostViewModel.swift
//  Kipalog
//
//  Created by DTVD on 2019/01/05.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PostViewModel: DependencyInjectable {
    typealias Dependency = Post

    var post: Post

    required init(dependency: Post) {
        self.post = dependency
    }

    func inject(dependency: Post) {
        self.post = dependency
    }
}
