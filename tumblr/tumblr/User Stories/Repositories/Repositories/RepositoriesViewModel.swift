//
//  FeedViewModel.swift
//  tumblr
//
//  Created by Patryk Górski on 09/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import RxCocoa
import RxSwift

protocol RepositoriesRouter {
    func showPageInBrowser(url: URL)
}

protocol RepositoriesViewModelInputs {
    func searchTextUpdated(_ text: String?)
}

protocol RepositoriesViewModelOutputs {
    var repositoriesBehaviorRelay: BehaviorRelay<[Repository]> { get }
}

final class RepositoriesViewModel: RepositoriesViewModelInputs, RepositoriesViewModelOutputs {
    
    private let router: RepositoriesRouter
    private let repositoryService: RepositoriesService
    private let disposeBag: DisposeBag = DisposeBag()
    
    private var page: Int = 1
    private var totalPages: Int = 0
    private var savedQuery: String = ""
    
    private var tempRepositories: [Repository] = []
    
    lazy var repositoriesBehaviorRelay: BehaviorRelay<[Repository]> = BehaviorRelay<[Repository]>(value: [])
    
    init(services: Services, router: RepositoriesRouter) {
        self.repositoryService = services.repositoriesService
        self.router = router
    }
    
    func fetchRepositoriesFor(query: String, paginationState: PaginationState = .initial) {
        repositoryService.fetchRepositories(for: query, page: page)
            .subscribe(onNext: { [unowned self] repos in
                switch paginationState {
                case .initial:
                    self.page = 1
                    self.totalPages = repos.totalPages
                    self.savedQuery = query
                    self.repositoriesBehaviorRelay.accept(repos.items)
                case .load:
                    self.tempRepositories = self.repositoriesBehaviorRelay.value
                    self.tempRepositories.append(contentsOf: repos.items)
                    self.repositoriesBehaviorRelay.accept(self.tempRepositories)
                }
                }, onError: { (error) in
                    print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
    func searchTextUpdated(_ text: String?) {
        guard let text = text else { return }
        if text != "" {
            fetchRepositoriesFor(query: text)
        } else {
            repositoriesBehaviorRelay.accept([])
        }
    }
    
    func showPageInBrowser(url: String) {
        guard let url = URL(string: url) else { return }
        router.showPageInBrowser(url: url)
    }
    
    func getMoreRepositories() {
        page += 1
        if page < totalPages {
            fetchRepositoriesFor(query: savedQuery, paginationState: .load)
        }
    }
}
