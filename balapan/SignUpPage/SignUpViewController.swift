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

    private let service = CreateUserService()
    public static var defaultsTokensKey = "accessTokens"

    // MARK: - UI

    private let welcomLabel: UILabel = {
        let label = UILabel()
        label.text = "Тіркелу"
        label.textColor = AppColor.gray900.uiColor
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Деректерді толтырыңыз"
        label.textColor = AppColor.gray500.uiColor
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = AppColor.gray900.uiColor
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
        textField.layer.borderColor = AppColor.gray300.cgColor
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
        label.textColor = AppColor.gray900.uiColor
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.layer.borderColor = AppColor.gray300.cgColor
        return textField
    }()
    private let isSecureIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage (systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage (systemName: "eye"), for: .highlighted)
        button.tintColor = AppColor.gray400.uiColor
        button.addTarget(self, action: #selector(togglePasswordVisibility(_:)), for: .touchUpInside)
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
        label.textColor = AppColor.gray900.uiColor
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private let repeatPasswordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.layer.borderColor =  AppColor.gray300.cgColor
        return textField
    }()
    private let repeatIsSecureIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage (systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage (systemName: "eye"), for: .highlighted)
        button.tintColor =  AppColor.gray400.uiColor
        button.addTarget(self, action: #selector(toggleRepeatPasswordVisibility(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Тіркелу", for: .normal)
        button.tintColor = .white
        button.backgroundColor =  AppColor.blue300.uiColor
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(registerButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Сізде аккаунт бар ма?"
        label.textColor =  AppColor.gray500.uiColor
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Кіру", for: .normal)
        button.tintColor =  AppColor.red300.uiColor
        button.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()

    }
    // MARK: - SetupViews

    private func setupViews() {

        [welcomLabel, label, emailLabel, emailTextField, passwordLabel, passwordTextField, repeatPasswordLabel, repeatPasswordTextField, loginButton, haveAccountLabel, registerButton].forEach {
            view.addSubview($0)
        }
        emailTextField.addSubview(emailIcon)
        passwordTextField.addSubview(passwordIcon)
        passwordTextField.addSubview(isSecureIcon)
        repeatPasswordTextField.addSubview(repeatPasswordIcon)
        repeatPasswordTextField.addSubview(repeatIsSecureIcon)

        emailTextField.leftView = emailIcon
        emailTextField.leftViewMode = .always
        passwordTextField.leftView = passwordIcon
        passwordTextField.leftViewMode = .always
        passwordTextField.rightView = isSecureIcon
        passwordTextField.rightViewMode = .always
        repeatPasswordTextField.leftView = repeatPasswordIcon
        repeatPasswordTextField.leftViewMode = .always
        repeatPasswordTextField.rightView = repeatIsSecureIcon
        repeatPasswordTextField.rightViewMode = .always
    }
    // MARK: - SetupConstraints
    private func setupConstraints() {
        [welcomLabel, label, emailLabel, emailTextField, passwordLabel, passwordTextField, repeatPasswordLabel, repeatPasswordTextField, registerButton].forEach {
            ($0).snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(24)
                make.trailing.equalToSuperview().offset(-24)
            }
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

    // MARK: - Actions

    @objc private func loginButtonTapped(_ sender: UIButton) {
        let controller = SignInViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @objc private func registerButtonTapped(_ sender: UIButton) {
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

        if password.isEmpty {
            self.showFailure()
            self.showSnackBar(message: "Пожалуйста, введите пароль.")
            return
        } else if password.count < 6 {
            self.showFailure()
            self.showSnackBar(message: "Пароль слишком короткий!")
            return
        }

        guard let passwordRepeated = repeatPasswordTextField.text else {
            self.showFailure()
            self.showSnackBar(message: "Повторный пароль введен неправильно.")
            return
        }

        if passwordRepeated.isEmpty {
            self.showFailure()
            self.showSnackBar(message: "Пожалуйста, повторите пароль.")
            return
        } else if password != passwordRepeated {
            self.showFailure()
            self.showSnackBar(message: "Пароли не совпадают.")
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
                    let controller = AddChildViewController()
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

    @objc private func showPassword(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = false
    }

    @objc private func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        isSecureIcon.setImage(UIImage(systemName: imageName), for: .normal)
    }

    @objc private func toggleRepeatPasswordVisibility(_ sender: UIButton) {
        repeatPasswordTextField.isSecureTextEntry.toggle()
        let imageName = repeatPasswordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        repeatIsSecureIcon.setImage(UIImage(systemName: imageName), for: .normal)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    // MARK: - SnackBar
    private func showSnackBar(message: String) {
        SnackBarController.showSnackBar(in: view, message: message, duration: .lengthShort)
    }

}

// MARK: - Extension

extension SignUpViewController: ProgressHudProtocol {
    func showSuccess() {
        ProgressHUD.show(icon: .succeed)
    }

    func showFailure() {
        ProgressHUD.show(icon: .failed)
    }
}
