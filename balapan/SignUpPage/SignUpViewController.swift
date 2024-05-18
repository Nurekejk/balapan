//
//  SignUpViewController.swift
//  balapan
//
//  Created by Nurbol on 11.04.2024.
//


import UIKit
import SnapKit
import ProgressHUD

class SignUpViewController: UIViewController {

    private let welcomLabel: UILabel = {
        let label = UILabel()
        label.text = "Тіркелу"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Деректерді толтырыңыз"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private let emailIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Message")
        return imageView
    }()

    private let emailTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Сіздің email"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = .init(red: 229/255, green: 235/255, blue: 240/255, alpha: 1)
        return textField
    }()


    private let passwordIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Password")
        return imageView
    }()
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөз"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.layer.borderColor = .init(red: 229/255, green: 235/255, blue: 240/255, alpha: 1)
        return textField
    }()
    private let isSecureIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage (systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage (systemName: "eye"), for: .highlighted)
        button.tintColor = UIColor(red: 107/255, green: 114/255, blue: 128/255, alpha: 0.7)
        return button
    }()


    private let repeatPasswordIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Password")
        return imageView
    }()
    private let repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөзді қайталаңыз"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private let repeatPasswordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.layer.borderColor = .init(red: 229/255, green: 235/255, blue: 240/255, alpha: 1)
        return textField
    }()
    private let repeatIsSecureIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage (systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage (systemName: "eye"), for: .highlighted)
        button.tintColor = UIColor(red: 107/255, green: 114/255, blue: 128/255, alpha: 0.7)
        return button
    }()

    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Тіркелу", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 77/255, green: 34/255, blue: 237/255, alpha: 1)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(registerButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Сізде аккаунт бар ма?"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Кіру", for: .normal)
        button.tintColor = UIColor(red: 179/255, green: 118/255, blue: 247/255, alpha: 1)
        button.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()

    }

    private func setupViews() {
        [welcomLabel, label, emailLabel, emailTextField, passwordLabel, passwordTextField, repeatPasswordLabel, repeatPasswordTextField, loginButton, haveAccountLabel, registerButton].forEach {
            view.addSubview($0)
        }
        emailTextField.addSubview(emailIcon)
        emailTextField.leftView = emailIcon
        emailTextField.leftViewMode = .always

        passwordTextField.addSubview(passwordIcon)
        passwordTextField.leftView = passwordIcon
        passwordTextField.leftViewMode = .always

        passwordTextField.addSubview(isSecureIcon)
        passwordTextField.rightView = isSecureIcon
        passwordTextField.rightViewMode = .always

        repeatPasswordTextField.addSubview(repeatPasswordIcon)
        repeatPasswordTextField.leftView = repeatPasswordIcon
        repeatPasswordTextField.leftViewMode = .always

        repeatPasswordTextField.addSubview(repeatIsSecureIcon)
        repeatPasswordTextField.rightView = repeatIsSecureIcon
        repeatPasswordTextField.rightViewMode = .always
    }

    private func setupConstraints() {
        [welcomLabel, label, emailLabel, emailTextField, passwordLabel, passwordTextField, repeatPasswordLabel, repeatPasswordTextField, registerButton].forEach {
            ($0).snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(24)
                make.trailing.equalToSuperview().offset(-24)            }
        }
        welcomLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(124)
            make.height.equalTo(34)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(welcomLabel.snp.bottom)
            make.height.equalTo(24)

        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(29)
            make.height.equalTo(21)

        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.height.equalTo(56)
        }
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.height.equalTo(21)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.height.equalTo(56)
        }
        repeatPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.height.equalTo(21)
        }
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordLabel.snp.bottom).offset(4)
            make.height.equalTo(56)
        }
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(40)
            make.height.equalTo(56)
        }
        haveAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(90)
            make.height.equalTo(22)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(24)
            make.leading.equalTo(haveAccountLabel.snp.trailing).offset(5)
            make.height.equalTo(22)
        }
    }

    @objc private func loginButtonTapped(_ sender: UIButton) {
        let controller = SignInViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc private func registerButtonTapped(_ sender: UIButton) {
        let controller = AddChildViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @objc private func showPassword(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = false
    }

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
