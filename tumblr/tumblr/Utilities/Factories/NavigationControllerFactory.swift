//
//  NavigationControllerFactory.swift
//  tumblr
//
//  Created by Patryk Górski on 07/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//
import UIKit

final class NavigationControllerFactory {
    
    static func makeNavigationController(modalPresentationStyle: UIModalPresentationStyle? = nil) -> NavigationController {
        let navigationController = NavigationController(navigationBarClass: BaseNavigationBar.self, modalPresentationStyle: modalPresentationStyle)
        return navigationController
    }
}
