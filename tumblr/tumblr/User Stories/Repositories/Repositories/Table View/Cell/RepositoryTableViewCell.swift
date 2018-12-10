//
//  RepositoryTableViewCell.swift
//  tumblr
//
//  Created by Patryk Górski on 10/12/2018.
//  Copyright © 2018 Patryk Górski. All rights reserved.
//

import UIKit

final class RepositoryTableViewCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        $0.textColor = Color.black
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let fullNameLabel: UILabel = {
        $0.textColor = Color.gray
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let descriptionLabel: UILabel = {
        $0.textColor = Color.black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let privacyLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let lastUpdateLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = Color.black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let languageLabel: UILabel = {
        $0.textColor = Color.black
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let usernameButton: UIButton = {
        $0.tintColor = Color.black
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    
    var onUsernameButtonTapHandler: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(repository: Repository) {
        nameLabel.text = repository.name
        fullNameLabel.text = repository.fullName
        descriptionLabel.text = repository.description
        privacyLabel.text = repository.privacy ? "Private" : "Public"
        privacyLabel.textColor = repository.privacy ? Color.red : Color.gray
        languageLabel.text = repository.language
        let formatter = DateFormatter().formatDate(dateFormat: .viewDate)
        let dateString = formatter.string(from: repository.updatedAt)
        lastUpdateLabel.text = "Last update: \(dateString)"
        usernameButton.setTitle(repository.owner.login, for: .normal)
        usernameButton.addTarget(self, action: #selector(onUsernameButtonTap), for: .touchUpInside)
    }
    
    @objc
    private func onUsernameButtonTap() {
        onUsernameButtonTapHandler?()
    }
}

extension RepositoryTableViewCell {
    
    private func setupUI() {
        selectionStyle = .none
        addSubview(nameLabel)
        addSubview(fullNameLabel)
        addSubview(descriptionLabel)
        addSubview(privacyLabel)
        addSubview(languageLabel)
        addSubview(lastUpdateLabel)
        addSubview(usernameButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            fullNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            fullNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            fullNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            privacyLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            privacyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            privacyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            lastUpdateLabel.topAnchor.constraint(equalTo: privacyLabel.bottomAnchor, constant: 8),
            lastUpdateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            usernameButton.topAnchor.constraint(equalTo: privacyLabel.bottomAnchor, constant: 8),
            usernameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            languageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            languageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
}
