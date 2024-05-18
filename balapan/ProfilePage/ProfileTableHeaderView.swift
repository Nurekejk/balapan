//
//  ProfileTableHeaderView.swift
//  balapan
//
//  Created by Nurbol on 18.05.2024.
//

import UIKit
import SnapKit

final class ProfileTableHeaderView: UITableViewHeaderFooterView {

    // MARK: - State
    static let reuseID = String(describing: ProfileTableHeaderView.self)

    // MARK: - UI
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileAvatar")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Менің профилім"
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "ali@gmail.com"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        return label
    }()

    // MARK: - Initializers
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views
    private func setupViews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(emailLabel)
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(104)
            make.width.equalTo(104)
        }
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
}
