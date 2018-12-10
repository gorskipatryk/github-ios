//
//  UserDetailsViewModel.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//
import UIKit

protocol UserDetailsRouter {
    func showPageInBrowser(url: URL)
}

protocol UserDetailsViewModelInputs {
    
}

protocol UserDetailsViewModelOutputs {
    var user: User { get }
}

final class UserDetailsViewModel: UserDetailsViewModelInputs, UserDetailsViewModelOutputs {
    
    private let router: UserDetailsRouter
    let user: User
    
    init(router: UserDetailsRouter, user: User) {
        self.router = router
        self.user = user
    }
    
    func showPageInBrowser() {
        guard let url = URL(string: user.url) else { return }
        router.showPageInBrowser(url: url)
    }
}
