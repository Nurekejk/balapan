//
//  SignInViewController.swift
//  balapan
//
//  Created by Nurbol on 10.04.2024.
//

import UIKit
import SnapKit
import ProgressHUD

class SignInViewController: UIViewController {

    private let service = SignInService()

    // MARK: - UI

    private let welcomLabel: UILabel = {
        let label = UILabel()
        label.text = "Cәлем"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Аккаунтқа кіріңіз"
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

    private let isSecureIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage (systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage (systemName: "eye"), for: .highlighted)
        button.tintColor = UIColor(red: 107/255, green: 114/255, blue: 128/255, alpha: 0.7)
        return button
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

    private let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.layer.borderColor = .init(red: 229/255, green: 235/255, blue: 240/255, alpha: 1)
        return textField
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөз"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var forgotPassword: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Құпия сөзді ұмыттыңыз ба?", for: .normal)
        button.tintColor = UIColor(red: 179/255, green: 118/255, blue: 247/255, alpha: 1)
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Кіру", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 77/255, green: 34/255, blue: 237/255, alpha: 1)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Аккаунтыныз жоқ па?"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()

    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Тіркелу", for: .normal)
        button.tintColor = UIColor(red: 179/255, green: 118/255, blue: 247/255, alpha: 1)
        button.addTarget(self, action: #selector(registerButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        self.hideKeyboardWhenTappedAround()

    }

    // MARK: - SetupViews

    private func setupViews() {
        [welcomLabel, label, emailLabel, emailTextField, passwordLabel, passwordTextField, forgotPassword, loginButton, haveAccountLabel, registerButton].forEach {
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
    }

    // MARK: - SetupConstraints

    private func setupConstraints() {
        [welcomLabel, label, emailLabel, emailTextField, passwordLabel, passwordTextField, loginButton].forEach {
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
        forgotPassword.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(22)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPassword.snp.bottom).offset(40)
            make.height.equalTo(56)
        }
        haveAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(90)
            make.height.equalTo(22)
        }
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(24)
            make.leading.equalTo(haveAccountLabel.snp.trailing).offset(5)
            make.height.equalTo(22)
        }
    }

    // MARK: - Actions

    @objc private func loginButtonTapped(_ sender: UIButton) {

        guard let email = emailTextField.text else {
            self.showFailure()
            self.showSnackBar(message: "Введите email.")
            return
        }

        guard let password = passwordTextField.text else {
            self.showFailure()
            self.showSnackBar(message: "Пароль введен неправильно.")
            return
        }

        var user = User(email: email)
        user.setPassword(password: password)

        service.fetchUser(with: user) { result in
            switch result {
            case .success(let data):
                self.showSuccess()
                let defaults = UserDefaults.standard
                if let data = try? JSONEncoder().encode(data) {
                    defaults.setValue(data, forKey: SignUpViewController.defaultsTokensKey)
                    let controller = TabBarViewController()
                    controller.navigationItem.hidesBackButton = true
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            case .failure:
                DispatchQueue.main.async {
                    self.showFailure()
                    self.showSnackBar(message: "Ошибка! Повторите еще раз.")
                }
            }
        }
    }

    @objc private func registerButtonTapped(_ sender: UIButton) {
        let controller = SignUpViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - SnackBar

    private func showSnackBar(message: String) {
        SnackBarController.showSnackBar(in: view, message: message, duration: .lengthShort)
    }

}

// MARK: - Extensions

extension SignInViewController: ProgressHudProtocol {
    func showSuccess() {
        ProgressHUD.show(icon: .succeed)
    }

    func showFailure() {
        ProgressHUD.show(icon: .failed)
    }
}
