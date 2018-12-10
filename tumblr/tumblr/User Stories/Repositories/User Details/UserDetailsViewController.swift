//
//  UserDetailsViewController.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class UserDetailsViewController: UIViewController {
    
    private lazy var contentView: UserDetailsView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UserDetailsView())
    
    private let viewModel: UserDetailsViewModel
    
    init(viewModel: UserDetailsViewModel) {
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
    }
}

extension UserDetailsViewController {
    
    private func setupUI() {
        title = viewModel.user.login
        view.addSubview(contentView)
    }
}
