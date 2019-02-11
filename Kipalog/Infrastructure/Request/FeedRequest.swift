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
        typealias Response = HotResponse

        var path: String {
            return "post/hot"
        }
    }

    struct HotResponse: Codable {
        let posts: [Post]
    }

}
