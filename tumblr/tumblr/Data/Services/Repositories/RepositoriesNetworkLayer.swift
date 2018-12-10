//
//  RepositoriesNetworkLayer.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import Moya
import RxSwift

final class RepositoriesNetworkLayer {
    
    private let githubProvider: MoyaProvider<GitHubAPI>
    
    init(githubProvider: MoyaProvider<GitHubAPI>) {
        self.githubProvider = githubProvider
    }
    
    func fetchRepositories(for query: String, page: Int) -> Observable<Response<Repository>> {
        return githubProvider.rx.request(.fetchRepositories(query: query, page: page)).asObservable()
            .map({ (response) -> Response<Repository> in
                do {
                    let response = try JSONDecoder().decode(Response<Repository>.self, from: response.data)
                    return response
                } catch {
                    throw error
                }
            })
    }
}
