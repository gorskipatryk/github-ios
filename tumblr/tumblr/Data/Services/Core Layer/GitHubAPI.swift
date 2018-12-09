//
//  TumblrAPI.swift
//  tumblr
//
//  Created by Patryk Górski on 09/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import Moya

private let kPerPageCount: Int = 10

enum GitHubAPI {
    case fetchRepositories(query: String, page: Int)
}

extension GitHubAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .fetchRepositories:
            guard let baseURL = URL(string: "https://api.github.com") else {
                fatalError("Failed to create Base URL")
            }
            return baseURL
        }
    }
    
    var path: String {
        switch self {
        case .fetchRepositories:
            return "/search/repositories"
        }
    }
    
    var method: Method {
        switch self {
        case .fetchRepositories:
            return .get
        }
    }
    
    var sampleData: Data {
        guard let sampleData = "{}".data(using: String.Encoding.utf8) else {
            fatalError("Failed to create Sample Data")
        }
        return sampleData
    }
    
    var task: Task {
        switch self {
        case .fetchRepositories(let query, let page):
            return .requestParameters(parameters: ["q" : query, "page" : page, "per_page" : kPerPageCount], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
