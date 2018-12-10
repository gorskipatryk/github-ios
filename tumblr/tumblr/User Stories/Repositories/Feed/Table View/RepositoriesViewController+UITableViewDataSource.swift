//
//  RepositoriesViewController+UITableViewDataSource.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import RxSwift

extension RepositoriesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.repositoriesBehaviorRelay.value.isEmpty ? tableView.setEmptyMessage("No results") : tableView.restore()
        return viewModel.repositoriesBehaviorRelay.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repository = viewModel.repositoriesBehaviorRelay.value[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RepositoryTableViewCell.self), for: indexPath) as? RepositoryTableViewCell else {
            fatalError("Dequed cell is of unexpected class.")
        }
        cell.setup(repository: repository)
        return cell
    }
}
