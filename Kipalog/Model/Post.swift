//
//  Post.swift
//  Kipalog
// 
//  Created by DTVD on 2017/12/24.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import Foundation

struct Meta: Codable {
    let kipalogCount: Int
    let commentsCount: Int
}

struct Post: Codable {
    let id: String
    let title: String
    let author: User
    let preview: String
    let meta: Meta
}
