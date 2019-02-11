//
//  FeedAPI.swift
//  Kipalog
// 
//  Created by DTVD on 2019-02-09.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import Foundation
import APIKit
import RxSwift

struct FeedAPI {
    func getFeed(for tab: FeedViewController.FeedTab) -> Observable<[Post]> {
        switch tab {
        case .top:
            return Session.send(request: FeedRequest.HotRequest())
            .map { response in
                return response.posts
            }
        case .new:
            return Observable.empty()
        case .til:
            return Observable.empty()
        }
    }
}
