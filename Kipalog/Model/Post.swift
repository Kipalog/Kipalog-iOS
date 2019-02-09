//
//  Post.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import Foundation

struct Post: Codable {
    let title: String
    let detail: String
    let author: User
    let kipalogCount: Int
    let commentsCount: Int

    private enum CodingKeys : String, CodingKey {
        case title
        case detail = "content"
        case author = "user"
        case kipalogCount = "like_cnt"
        case commentsCount = "cmts_cnt"
    }
}