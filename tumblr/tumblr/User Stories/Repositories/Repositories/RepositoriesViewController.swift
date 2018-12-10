//
//  FeedViewController.swift
//  tumblr
//
//  Created by Patryk Górski on 09/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//
import RxSwift
import UIKit

final class RepositoriesViewController: UIViewController {
    
    let viewModel: RepositoriesViewModel
    private let disposeBag: DisposeBag = DisposeBag()
    
    private lazy var contentView: RepositoriesView = {
        $0.tableView.dataSource = self
        $0.tableView.delegate = self
        $0.searchBar.delegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(RepositoriesView())
    
    init(viewModel: RepositoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupContentViewConstraints(contentView)
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.repositoriesBehaviorRelay.subscribe(onNext: { _ in
            self.contentView.tableView.reloadData()
        })
        .disposed(by: disposeBag)
        contentView.searchBar.rx.text.asDriver()
            .throttle(2)
            .distinctUntilChanged()
            .drive(onNext: { (text) in
                self.viewModel.searchTextUpdated(text)
            })
        .disposed(by: disposeBag)
    }
}

extension RepositoriesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension RepositoriesViewController {
    
    private func setupUI() {
        view.addSubview(contentView)
        title = "GitHub"
    }
}
