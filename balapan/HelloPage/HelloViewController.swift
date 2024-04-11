//
//  HelloViewController.swift
//  balapan
//
//  Created by Nurbol on 26.03.2024.
//

import UIKit
import SnapKit

class HelloViewController: UIViewController {

    let helloImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = AppImage.hello.uiImage
        return image
    }()

    let welcomLabel: UILabel = {
        let label = UILabel()
        label.text = "Қош келдіңіз!"
        label.textColor = UIColor(red: 83/255, green: 36/255, blue: 242/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 32, weight: .medium)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Balapan - бұл сіздің балаңыздың дамуына арналған платформа."
        label.textColor = UIColor(red: 105/255, green: 101/255, blue: 101/255, alpha: 0.4)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Бастау", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 83/255, green: 36/255, blue: 242/255, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        setupViews()
        setupConstraints()
        startButton.layer.cornerRadius = 8
    }

    private func setupViews() {
        view.addSubview(helloImage)
        view.addSubview(welcomLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(startButton)
    }
    private func setupConstraints() {
        helloImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(120)
        }

        welcomLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(helloImage.snp.top).offset(427)
            make.width.equalTo(216)
            make.height.equalTo(48)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(298)
            make.height.equalTo(48)
        }
        startButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(78)
            make.centerX.equalToSuperview()
            make.width.equalTo(327)
            make.height.equalTo(56)
        }

    }
    @objc private func buttonTapped(_ sender: UIButton) {
        let controller = SignInViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
