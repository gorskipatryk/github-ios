//
//  AppCoordinator.swift
//  tumblr
//
//  Created by Patryk Górski on 07/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//
import UIKit

final class AppCoordinator: Coordinator {
    
    init(services: Services, parentNavigationController: UINavigationController) {
        super.init(services: services, parentNavigationController: parentNavigationController, childNavigationController: parentNavigationController)
    }
    
    override func start() {
        runRepositoriesUserStory()
    }
}
