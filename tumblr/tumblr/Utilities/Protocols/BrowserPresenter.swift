//
//  BrowserPresenter.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import SafariServices
import UIKit

protocol BrowserPresenter {
    func showInBrowser(url: URL, from viewController: UIViewController)
}

extension BrowserPresenter {
    
    func showInBrowser(url: URL, from viewController: UIViewController) {
        let safariViewController = SFSafariViewController(url: url)
        viewController.present(safariViewController, animated: true, completion: nil)
    }
}
