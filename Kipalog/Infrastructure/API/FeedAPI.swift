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
                return response.posts.map { $0.standardize() }
            }
        case .new:
            return Session.send(request: FeedRequest.NewestRequest())
                .map { response in
                    return response.posts.map { $0.standardize() }
                }
        case .til:
            return Session.send(request: FeedRequest.TilRequest())
                .map { response in
                    return response.posts.map { $0.standardize() }
                }
        }
    }

    func getTopAuthor() -> Observable<[User]> {
        return Session.send(request: FeedRequest.TopAuthorRequest())
            .map { (response: FeedRequest.TopAuthorResponse) in
                return response.users.map { $0.standardize() }
            }
    }
}
