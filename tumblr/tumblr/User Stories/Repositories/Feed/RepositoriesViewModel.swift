//
//  FeedViewModel.swift
//  tumblr
//
//  Created by Patryk Górski on 09/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import RxSwift

final class RepositoriesViewModel {
    
    private let repositoryService: RepositoriesService
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(services: Services) {
        self.repositoryService = services.repositoriesService
        fetchRepo()
    }
    
    func fetchRepo() {
        repositoryService.fetchRepositories(for: "rxswift", page: 1)
            .subscribe(onNext: { (repos) in
                print(repos.items.first?.id)
                print(repos.items.first?.name)
                print(repos.items.first?.fullName)
                print(repos.items.first?.privacy)
                print(repos.items.first?.owner.id)
                print(repos.items.first?.owner.login)
                print(repos.items.first?.owner.avatarStringURL)
                print(repos.items.first?.owner.type)
                print(repos.items.first?.owner.url)
                print(repos.items.first?.description)
                print(repos.items.first?.url)
                print(repos.items.first?.isFork)
                print(repos.items.first?.createdAt)
                print(repos.items.first?.updatedAt)
                print(repos.items.first?.stars)
                print(repos.items.first?.language)
            }, onError: { (error) in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
}
