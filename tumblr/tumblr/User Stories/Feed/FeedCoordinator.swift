//
//  FeedCoordinator.swift
//  tumblr
//
//  Created by Patryk Górski on 07/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class FeedCooridnator: Coordinator {
    
    init(services: Services, parentNavigationController: UINavigationController) {
        let childNavigationController = NavigationControllerFactory.makeNavigationController()
        super.init(services: services, parentNavigationController: parentNavigationController, childNavigationController: childNavigationController)
    }
    
    override func start() {
        showFeedScreen()
    }
    
    func showFeedScreen() {
        print("feed"
    }
}
