//
//  SearchViewController.swift
//  balapan
//
//  Created by Nurbol on 26.03.2024.
//

import UIKit

class SearchViewController: UIViewController {
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Іздеу"
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = .init(red: 243/255, green: 244/255, blue: 246/255, alpha: 1)
        return textField
    }()

    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage (named: "searchIcon"), for: .normal)
        button.tintColor =  UIColor(red: 55/255, green: 65/255, blue: 81/255, alpha: 1)
        button.backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 246/255, alpha: 1)
        return button
    }()
    private let paddingView: UIView = {
        let uiView = UIView()
        return uiView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()

    }

    private func setupViews() {
        view.addSubview(textField)
        textField.addSubview(searchButton)
        textField.addSubview(paddingView)
        textField.rightView = searchButton
        textField.leftView = paddingView
        searchButton.layer.cornerRadius = 8
        textField.leftViewMode = .always
        textField.rightViewMode = .always
    }

    private func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(132)
            make.centerX.equalToSuperview()
            make.width.equalTo(342)
            make.height.equalTo(56)
        }
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(56)
        }
        paddingView.snp.makeConstraints { make in
            make.width.equalTo(16)
        }

    }


}
