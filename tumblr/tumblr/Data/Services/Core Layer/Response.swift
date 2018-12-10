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
    }
    
    let items: [T]
    
    init(items: [T]) {
        self.items = items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([T].self, forKey: .items)
    }
}
