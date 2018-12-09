//
//  NavigationController.swift
//  tumblr
//
//  Created by Patryk Górski on 07/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    
    init(navigationBarClass: AnyClass?, modalPresentationStyle: UIModalPresentationStyle? = nil) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: nil)
        setup(modalPresentationStyle: modalPresentationStyle)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        interactivePopGestureRecognizer?.delegate = viewController as? UIGestureRecognizerDelegate
        super.pushViewController(viewController, animated: animated)
    }
    
    private func setup(modalPresentationStyle: UIModalPresentationStyle?) {
        self.modalTransitionStyle = .crossDissolve
        if let modalPresentationStyle = modalPresentationStyle {
            self.modalPresentationStyle = modalPresentationStyle
        }
    }
}
