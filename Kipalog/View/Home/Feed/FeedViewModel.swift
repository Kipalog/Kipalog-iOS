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
    private let disposeBag = DisposeBag()
    private let api = FeedAPI()

    lazy var topAuthor: Driver<[User]> = {
        return api.getTopAuthor()
            .asDriver(onErrorDriveWith: .empty())
    }()

    init(_ startTab: FeedViewController.FeedTab) {
        dataSource = api.getFeed(for: startTab)
            .asDriver(onErrorDriveWith: .empty())
            .map { DataSource(posts: $0) }
    }
}
