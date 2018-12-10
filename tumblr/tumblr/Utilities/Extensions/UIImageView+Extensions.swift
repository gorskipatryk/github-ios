//
//  UIImageView+Extensions.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import Kingfisher
import UIKit

extension UIImageView {
    
    func setImage(stringURL: String?) {
        guard let stringURL = stringURL, let url = URL(string: stringURL) else { return }
        kf.setImage(with: url)
    }
}
