//
//  FeedView.swift
//  tumblr
//
//  Created by Patryk Górski on 09/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class RepositoriesView: UIView {
    
    let searchBar: UISearchBar = {
        $0.placeholder = "Type to search repositories"
        $0.backgroundImage = UIImage()
        $0.barTintColor = Color.white
        $0.isTranslucent = false
        $0.tintColor = Color.white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UISearchBar())
    
    private let separatorView: UIView = {
        $0.backgroundColor = Color.gray.withAlphaComponent(0.2)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    let tableView: UITableView = {
        $0.backgroundColor = Color.white
        $0.register(RepositoryTableViewCell.self, forCellReuseIdentifier: String(describing: RepositoryTableViewCell.self))
        $0.separatorStyle = .none
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RepositoriesView {
    
    private func setupUI() {
        backgroundColor = Color.white
        addSubview(searchBar)
        addSubview(separatorView)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                
                separatorView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                separatorView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                
                tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: topAnchor),
                searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
                separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
        NSLayoutConstraint.activate([
            searchBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.07),
            
            separatorView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            tableView.topAnchor.constraint(equalTo: separatorView.bottomAnchor)
        ])
    }
}
