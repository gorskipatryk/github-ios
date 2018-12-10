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
    
    static func makeUserDetailsViewController(router: UserDetailsRouter, user: User) -> UserDetailsViewController {
        let viewModel = UserDetailsViewModel(router: router, user: user)
        let viewController = UserDetailsViewController(viewModel: viewModel)
        return viewController
    }
}
