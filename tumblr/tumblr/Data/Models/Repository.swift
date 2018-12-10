//
//  Repository.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import Foundation

final class Repository: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case privacy = "private"
        case owner
        case description
        case url = "html_url"
        case isFork = "fork"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case stars = "stargazers_count"
        case language
    }
    
    let id: Int
    let name: String
    let fullName: String
    let privacy: Bool
    let owner: User
    let description: String
    let url: String
    let isFork: Bool
    let createdAt: Date
    let updatedAt: Date
    let stars: Int
    let language: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        privacy = try container.decode(Bool.self, forKey: .privacy)
        owner = try container.decode(User.self, forKey: .owner)
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        url = try container.decode(String.self, forKey: .url)
        isFork = try container.decode(Bool.self, forKey: .isFork)
        let createdAtString = try container.decode(String.self, forKey: .createdAt)
        let formatter = DateFormatter().formatDate(dateFormat: .githubDate)
        if let date = formatter.date(from: createdAtString) {
            createdAt = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .createdAt, in: container, debugDescription: "createdAt has wrong format")
        }
        let updatedAtString = try container.decode(String.self, forKey: .updatedAt)
        if let date = formatter.date(from: updatedAtString) {
            updatedAt = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .createdAt, in: container, debugDescription: "createdAt has wrong format")
        }
        stars = try container.decode(Int.self, forKey: .stars)
        language = try container.decode(String.self, forKey: .language)
    }
}
