//
//  KipalogRequest.swift
//  Kipalog
// 
//  Created by DTVD on 2019-02-09.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import Foundation
import APIKit

protocol KipalogRequest: Request where Response: Decodable {
}

extension KipalogRequest {
    var baseURL: URL {
        return URL(string: "http://localhost:3000/api/v1/")!
    }

    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }

    var headerFields: [String : String] {
        return [
            "X-Kipalog-Token": "cdtaz9rkg506a79y5dy1odo0ce4q0f"
        ]
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try decoder.decode(Response.self, from: data)
    }
}

protocol KipalogPostRequest: KipalogRequest {
}

extension KipalogRequest {
    var method: HTTPMethod {
        return .post
    }
}

protocol KipalogGetRequest: KipalogRequest {
}

extension KipalogGetRequest {
    var method: HTTPMethod {
        return .get
    }
}
