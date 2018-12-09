//
//  FeedViewController.swift
//  tumblr
//
//  Created by Patryk Górski on 09/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let viewModel: FeedViewModel
    
    private let contentView: FeedView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(FeedView())
    
    init(viewModel: FeedViewModel) {
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

extension FeedViewController {
    
    private func setupUI() {
        view.addSubview(contentView)
        title = "test"
    }
}
