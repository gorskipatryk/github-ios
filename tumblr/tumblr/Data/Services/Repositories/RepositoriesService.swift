//
//  RepositoriesService.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import Moya
import RxSwift

final class RepositoriesService {
    
    private let networkLayer: RepositoriesNetworkLayer
    
    init(githubMoyaProvider: MoyaProvider<GitHubAPI>) {
        self.networkLayer = RepositoriesNetworkLayer(githubProvider: githubMoyaProvider)
    }
    
    func fetchRepositories(for query: String, page: Int) -> Observable<Response<Repository>> {
        return networkLayer.fetchRepositories(for: query, page: page)
    }
}
