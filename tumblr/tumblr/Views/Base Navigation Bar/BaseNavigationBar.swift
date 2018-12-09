//
//  BaseNavigationBar.swift
//  tumblr
//
//  Created by Patryk Górski on 07/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class BaseNavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseNavigationBar {
    
    private func setupUI() {
        backgroundColor = Color.white
        barTintColor = Color.black
        titleTextAttributes = [.foregroundColor: Color.black]
        isTranslucent = false
    }
}
