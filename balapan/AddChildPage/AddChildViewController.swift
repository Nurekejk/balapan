//
//  AddChildViewController.swift
//  balapan
//
//  Created by Nurbol on 14.05.2024.
//

import UIKit
import ProgressHUD
import SnapKit

enum ControllerMode {
    case boy
    case girl
}

class AddChildViewController: UIViewController {
    private var ages = ["1", "2", "3", "4", "5", "6", "7"]
    private var selectedAge = ""

    var mode: ControllerMode = .boy

    // MARK: - UI

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Есімі"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = AppColor.gray900.uiColor
        return label
    }()

    private let childNameTextField: DefaultTextField = {
        let textField = DefaultTextField()
        textField.placeholder = "Баланың есімі"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = AppColor.gray300.cgColor
        return textField
    }()

    private let boyLabel: UILabel = {
        let label = UILabel()
        label.text = "Ұл"
        label.textColor = AppColor.gray900.uiColor
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    private let boyIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "boy")
        return imageView
    }()
    private let girlLabel: UILabel = {
        let label = UILabel()
        label.text = "Қыз"
        label.textColor = AppColor.gray900.uiColor
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    private let girlIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "girl")
        return imageView
    }()

    private let boyUIControl: UIControl = {
        let uiControl = UIControl()
        uiControl.backgroundColor = .white
        uiControl.layer.cornerRadius = 10
        uiControl.layer.borderWidth = 2
        uiControl.layer.borderColor = AppColor.red300.cgColor
        uiControl.addTarget(self, action: #selector(boyUIControlDidPressed), for: .touchUpInside)
        return uiControl
    }()
    private let girlUIControl: UIControl = {
        let uiControl = UIControl()
        uiControl.layer.cornerRadius = 10
        uiControl.backgroundColor = .white
        uiControl.layer.borderColor = AppColor.gray300.cgColor
        uiControl.layer.borderWidth = 2
        uiControl.addTarget(self, action: #selector(girlControlDidPressed), for: .touchUpInside)
        return uiControl
    }()

    var genderImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "boyBig")
        return imageView
    }()
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Жасы"
        label.textColor =  AppColor.gray900.uiColor
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AgeCollectionViewCell.self, forCellWithReuseIdentifier: AgeCollectionViewCell.identifier)
        view.backgroundColor = .white
        collectionView.isScrollEnabled = false
        return collectionView
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Алға", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.backgroundColor = AppColor.blue300.uiColor
        button.addTarget(self, action: #selector(nextButtonDidPressed), for: .touchUpInside)
        return button
    }()

    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Өткізу", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = AppColor.gray300.cgColor
        button.addTarget(self, action: #selector(skipButtonDidPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        title = "Баланы тіркеу"
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    // MARK: - SetupViews
    func setupViews(){
        view.addSubview(nameLabel)
        view.addSubview(childNameTextField)
        view.addSubview(boyUIControl)
        boyUIControl.addSubview(boyIcon)
        boyUIControl.addSubview(boyLabel)
        view.addSubview(girlUIControl)
        girlUIControl.addSubview(girlIcon)
        girlUIControl.addSubview(girlLabel)
        view.addSubview(genderImage)
        view.addSubview(ageLabel)
        view.addSubview(collectionView)
        view.addSubview(nextButton)
        view.addSubview(skipButton)


    }
    // MARK: - SetupConstraints
    func setupConstraints(){
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(121)
            make.leading.equalToSuperview().offset(24)
        }
        childNameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        boyUIControl.snp.makeConstraints { make in
            make.top.equalTo(childNameTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.width.equalTo(142)
            make.height.equalTo(54)
        }
        girlUIControl.snp.makeConstraints { make in
            make.top.equalTo(childNameTextField.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-24)
            make.width.equalTo(142)
            make.height.equalTo(54)
        }
        boyIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        boyLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(boyIcon.snp.trailing).offset(32)
        }
        girlIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        girlLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(girlIcon.snp.trailing).offset(32)
        }
        genderImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(boyUIControl.snp.bottom).offset(16)
        }
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(genderImage.snp.bottom).offset(16)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(ageLabel.snp.bottom).offset(16)
            make.height.equalTo(70)
        }
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        skipButton.snp.makeConstraints { make in
            make.top.equalTo(nextButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
    }
    // MARK: - Actions

    @objc private func boyUIControlDidPressed(_ sender: UIButton) {
        self.mode = .boy
        genderImage.image = UIImage(named: "boyBig")
        boyUIControl.layer.borderColor = AppColor.color10.cgColor
        girlUIControl.layer.borderColor = .init(red: 229/255, green: 235/255, blue: 240/255, alpha: 1)
        reloadInputViews()

    }
    @objc private func girlControlDidPressed(_ sender: UIButton) {
        self.mode = .girl
        girlUIControl.layer.borderColor = AppColor.color10.cgColor
        boyUIControl.layer.borderColor = .init(red: 229/255, green: 235/255, blue: 240/255, alpha: 1)
        genderImage.image = UIImage(named: "girlBig")
    }

    @objc private func nextButtonDidPressed(_ sender: UIButton) {
        guard let password = childNameTextField.text else {
            self.showFailure()
            self.showSnackBar(message: "Баланыңыздың ісімін еңгізіңіз.")
            return
        }

        if password.isEmpty {
            self.showFailure()
            self.showSnackBar(message: "Баланыңыздың ісімін еңгізіңіз.")
            return
        }

        if selectedAge.isEmpty {
            self.showFailure()
            self.showSnackBar(message: "Баланыңыздың жасын таңдаңыз.")
            return
        } else {
            let gender: String
            if self.mode == .boy{
                gender = "male"
            }else {gender = "female"}
            let controller = FilterViewController(gender: gender, age: Int(selectedAge)!)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    @objc private func skipButtonDidPressed(_ sender: UIButton) {
        let controller = TabBarViewController()
        self.navigationController?.pushViewController(controller, animated: true)
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

// MARK: - Extenshions
extension AddChildViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ProgressHudProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AgeCollectionViewCell.identifier, for: indexPath) as!     AgeCollectionViewCell
        cell.childAgelabel.text = ages[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: 40,
            height: 70
        )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? AgeCollectionViewCell {
            cell.childAgelabel.textColor = AppColor.blue300.uiColor
            cell.layer.borderColor = AppColor.blue300.cgColor
            cell.layer.cornerRadius = 5
            cell.layer.borderWidth = 2
            self.selectedAge = ages[indexPath.item]
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? AgeCollectionViewCell {
            cell.childAgelabel.textColor = AppColor.gray500.uiColor
            cell.layer.cornerRadius = 0
            cell.layer.borderWidth = 0

        }
    }
    // MARK: - ProgressHUD

    func showSuccess() {
        ProgressHUD.show(icon: .succeed)
    }

    func showFailure() {
        ProgressHUD.show(icon: .failed)
    }

}

