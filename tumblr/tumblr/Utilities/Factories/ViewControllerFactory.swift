//
//  ViewControllerFactory.swift
//  tumblr
//
//  Created by Patryk Górski on 09/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class ViewControllerFactory {
    
    static func makeFeedViewController(services: Services, router: RepositoriesRouter) -> RepositoriesViewController {
        let viewModel = RepositoriesViewModel(services: services, router: router)
        let viewController = RepositoriesViewController(viewModel: viewModel)
        return viewController
    }
}
