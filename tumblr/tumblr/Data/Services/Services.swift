//
//  Services.swift
//  tumblr
//
//  Created by Patryk Górski on 07/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//
import Moya

final class Services {
    
    private lazy var githubMoyaProvider: MoyaProvider = MoyaProvider<GitHubAPI>()
    
    lazy var repositoriesService: RepositoriesService = RepositoriesService(githubMoyaProvider: githubMoyaProvider)
}
