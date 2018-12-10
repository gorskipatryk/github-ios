//
//  FeedViewModel.swift
//  tumblr
//
//  Created by Patryk Górski on 09/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import RxCocoa
import RxSwift

protocol RepositoriesViewModelInputs {
    
}

protocol RepositoriesViewModelOutputs {
    
}

final class RepositoriesViewModel {
    
    private let repositoryService: RepositoriesService
    private let disposeBag: DisposeBag = DisposeBag()
    
    private var page: Int = 1
    
    lazy var repositoriesBehaviorRelay: BehaviorRelay<[Repository]> = BehaviorRelay<[Repository]>(value: [])
    
    init(services: Services) {
        self.repositoryService = services.repositoriesService
        fetchRepo()
    }
    
    func fetchRepo() {
        repositoryService.fetchRepositories(for: "rxswift", page: page)
            .subscribe(onNext: { [unowned self] repos in
                self.repositoriesBehaviorRelay.accept(repos.items)
            }, onError: { (error) in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
}
