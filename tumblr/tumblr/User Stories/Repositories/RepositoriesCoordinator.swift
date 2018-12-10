//
//  FeedCoordinator.swift
//  tumblr
//
//  Created by Patryk Górski on 07/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class RepositoriesCoordinator: Coordinator, BrowserPresenter, RepositoriesRouter, UserDetailsRouter {
    
    init(services: Services, parentNavigationController: UINavigationController) {
        let childNavigationController = NavigationControllerFactory.makeNavigationController()
        super.init(services: services, parentNavigationController: parentNavigationController, childNavigationController: childNavigationController)
    }
    
    override func start() {
        showFeedScreen()
    }
    
    func showFeedScreen() {
        let viewController = ViewControllerFactory.makeFeedViewController(services: services, router: self)
        childNavigationController.setViewControllers([viewController], animated: false)
        parentNavigationController.present(childNavigationController, animated: true, completion: nil)
    }
    
    func showPageInBrowser(url: URL) {
        showInBrowser(url: url, from: childNavigationController)
    }
    
    func showUserDetails(user: User) {
        let viewController = ViewControllerFactory.makeUserDetailsViewController(router: self, user: user)
        childNavigationController.pushViewController(viewController, animated: true)
    }
}
