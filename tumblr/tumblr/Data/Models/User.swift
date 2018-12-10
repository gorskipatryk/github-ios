//
//  User.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import Foundation

final class User: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarStringURL = "avatar_url"
        case type
        case url = "html_url"
    }
    
    let id: Int
    let login: String
    let avatarStringURL: String
    let type: String
    let url: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        login = try container.decode(String.self, forKey: .login)
        avatarStringURL = try container.decodeIfPresent(String.self, forKey: .avatarStringURL) ?? ""
        type = try container.decode(String.self, forKey: .type)
        url = try container.decode(String.self, forKey: .url)
    }
}
