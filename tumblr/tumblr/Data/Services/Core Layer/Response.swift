//
//  Meta.swift
//  tumblr
//
//  Created by Patryk Górski on 09/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case items
        case totalCount = "total_count"
    }
    
    let items: [T]
    let totalCount: Int
    
    init(items: [T], totalCount: Int) {
        self.items = items
        self.totalCount = totalCount
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([T].self, forKey: .items)
        totalCount = try container.decode(Int.self, forKey: .totalCount)
    }
}
