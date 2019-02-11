//
//  FeedRequest.swift
//  Kipalog
// 
//  Created by DTVD on 2019-02-09.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import Foundation
import APIKit

struct FeedRequest {

    struct HotRequest: KipalogGetRequest {
        typealias Response = FeedResponse

        var path: String {
            return "post/hot"
        }
    }

    struct NewestRequest: KipalogGetRequest {
        typealias Response = FeedResponse

        var path: String {
            return "post/newest"
        }
    }
    
    struct TilRequest: KipalogGetRequest {
        typealias Response = FeedResponse

        var path: String {
            return "post/til"
        }
    }

    struct FeedResponse: Codable {
        let posts: [Post]
    }

    struct TopAuthorRequest: KipalogGetRequest {
        typealias Response = TopAuthorResponse

        var path: String {
            return "user/top"
        }
    }

    struct TopAuthorResponse: Codable {
        let users: [User]
    }

}
