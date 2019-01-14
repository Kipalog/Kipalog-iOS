//
//  ButtonsViewModel.swift
//  Kipalog
//
//  Created by DTVD on 2019/01/14.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ButtonsViewModel: DependencyInjectable {
    typealias Dependency = Post

    var post: Post
    var followStream = PublishRelay<Bool>()
    private var followed: Bool {
        didSet {
            followStream.accept(followed)
        }
    }

    var kipalogStream = PublishRelay<Bool>()
    private var kipaloged: Bool {
        didSet {
            kipalogStream.accept(kipaloged)
        }
    }

    required init(dependency: Post) {
        self.post = dependency
        self.followed = false
        self.kipaloged = false
    }

    func inject(dependency: Post) {
        self.post = dependency
    }

    func toggleFollow() {
        followed = !followed
    }

    func toggleKipalog() {
        kipaloged = !kipaloged
    }
}
