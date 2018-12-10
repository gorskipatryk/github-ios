//
//  Coordinator.swift
//  tumblr
//
//  Created by Patryk Górski on 07/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//
import UIKit

class Coordinator {
    
    let services: Services
    let parentNavigationController: UINavigationController
    let childNavigationController: UINavigationController
    
    var coordinators: [Coordinator] = []
    
    var onCloseUserStoryHandler: (() -> Void)?
    
    init(services: Services, parentNavigationController: UINavigationController, childNavigationController: UINavigationController) {
        self.services = services
        self.parentNavigationController = parentNavigationController
        self.childNavigationController = childNavigationController
    }
    
    func start() { }
    
    func addDependency(_ coordinator: Coordinator) {
        for element in coordinators where element === coordinator { return }
        coordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard !coordinators.isEmpty, let coordinator = coordinator else { return }
        for (index, element) in coordinators.enumerated() where element === coordinator {
            coordinators.remove(at: index)
            break
        }
    }
    
    func closeUserStory() {
        parentNavigationController.dismiss(animated: true, completion: { [unowned self] in
            self.onCloseUserStoryHandler?()
        })
    }
}

extension Coordinator {
    
    func runRepositoriesUserStory() {
        let coordinator = RepositoriesCoordinator(services: services, parentNavigationController: childNavigationController)
        coordinator.onCloseUserStoryHandler = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
