//
//  SearchViewModel.swift
//  Kipalog
// 
//  Created by DTVD on 2018/01/09.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
     struct DataSource {
        let posts: [Post]
    }

    private(set) var dataSource: Signal<DataSource>!

    init(searchText: Signal<String>) {
        let fixtureSource = DataSource(posts: [
        ])

        dataSource = Signal.merge(
            searchText
                .filter{ $0.isEmpty }
                .map { _ in DataSource(posts: [])},
            searchText
                .filter{ !$0.isEmpty }
                .map{ _ in fixtureSource }
        )

    }

}
