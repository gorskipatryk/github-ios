//
//  UserDetailsView.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class UserDetailsView: UIView {
    
    private let userAvatar: UIImageView = {
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private let userLoginLabel: UILabel = {
        $0.textColor = Color.black
        $0.font = UIFont.systemFont(ofSize: 24)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let userTypeLabel: UILabel = {
        $0.textColor = Color.gray
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    let userProfileLinkButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(user: User) {
        userAvatar.setImage(stringURL: user.avatarStringURL)
        userLoginLabel.text = user.login
        userTypeLabel.text = user.type
        userProfileLinkButton.setTitle(user.url, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userAvatar.layer.cornerRadius = userAvatar.frame.size.width / 2
    }
}

extension UserDetailsView {
    
    private func setupUI() {
        backgroundColor = Color.white
        addSubview(userAvatar)
        addSubview(userLoginLabel)
        addSubview(userTypeLabel)
        addSubview(userProfileLinkButton)
    }
    
    private func setupConstraints() {
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                userAvatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
                userAvatar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                userLoginLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
                userLoginLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
                userTypeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
                userTypeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
                userProfileLinkButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
                userProfileLinkButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
            ])
        } else {
            NSLayoutConstraint.activate([
                userAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 32),
                
                userLoginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                userLoginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
                userTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                userTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
                userProfileLinkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                userProfileLinkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            ])
        }
        NSLayoutConstraint.activate([
            userAvatar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            userAvatar.widthAnchor.constraint(equalTo: userAvatar.heightAnchor),
            
            userLoginLabel.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 16),
            
            userTypeLabel.topAnchor.constraint(equalTo: userLoginLabel.bottomAnchor, constant: 8),
            
            userProfileLinkButton.topAnchor.constraint(equalTo: userTypeLabel.bottomAnchor, constant: 8)
        ])
    }
}
