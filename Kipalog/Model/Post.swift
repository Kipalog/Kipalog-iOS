//
//  Post.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import Foundation

struct Post: Codable {
    let id: String
    let title: String
    let preview: String
    let author: User
    let kipalogCount: Int
    let commentsCount: Int

    private enum CodingKeys : String, CodingKey {
        case id
        case title
        case preview
        case author = "user"
        case kipalogCount = "likeCnt"
        case commentsCount = "cmtsCnt"
    }
}
