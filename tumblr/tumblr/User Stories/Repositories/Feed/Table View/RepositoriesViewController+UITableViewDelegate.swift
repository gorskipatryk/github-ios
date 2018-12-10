//
//  RepositoriesViewController+UITableViewDelegate.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

extension RepositoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showPageInBrowser(url: viewModel.repositoriesBehaviorRelay.value[indexPath.row].url)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
