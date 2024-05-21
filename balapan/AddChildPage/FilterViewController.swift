//
//  FilterViewController.swift
//  balapan
//
//  Created by Nurbol on 15.05.2024.
//

import UIKit

class FilterViewController: UIViewController {

    private let service = FilterService()
    private var janrs = ["Музыка", "Спорт", "Сурет", "Ғарыш", "Тарих", "Математика", "Көліктер" , "Ертегілер", "Батырлар"]
    private var selectedJanrs: [String] = []
    private var gender: String
    private var age: Int

    

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Баланың қызығушылықтарын таңдаңыз"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
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
        button.backgroundColor = AppColor.color12.uiColor
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
        button.layer.borderColor = AppColor.color11.cgColor
        button.addTarget(self, action: #selector(skipButtonDidPressed), for: .touchUpInside)
        return button
    }()

    init(gender: String, age: Int) {
        self.gender = gender
        self.age = age
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Баланы тіркеу"
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }

    func setupViews(){
        view.addSubview(label)
        view.addSubview(collectionView)
        view.addSubview(nextButton)
        view.addSubview(skipButton)

    }
    func setupConstraints(){
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(121)
            make.leading.equalToSuperview().offset(24)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(label.snp.bottom).offset(16)
            make.height.equalTo(530)
        }
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        skipButton.snp.makeConstraints { make in
            make.top.equalTo(nextButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }

    }

    @objc private func nextButtonDidPressed(_ sender: UIButton) {
        let request = UpdateUserFilterRequest(categories: selectedJanrs, types: selectedJanrs, gender: gender, age: 5)
        service.updateUserFilter(requestBody: request) { result in
            switch result {
            case .success(let response):
                print("Filter updated successfully. Response: \(response)")
                let controller = TabBarViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            case .failure(let error):
                print("Failed to update filter. Error: \(error.error)")
            }
        }
    }
    @objc private func skipButtonDidPressed(_ sender: UIButton) {
        let controller = TabBarViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

extension FilterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return janrs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell
        cell.janrlabel.text = janrs[indexPath.item]
        cell.layer.cornerRadius = 10
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: janrs[indexPath.item].count * 12,
            height: 34
        )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        4
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FilterCollectionViewCell {
            if cell.isAdded == false{
                selectedJanrs.append(janrs[indexPath.item])
                cell.contentView.backgroundColor = AppColor.color12.uiColor
                cell.janrlabel.textColor = .white
                cell.isAdded = true
            } else {
                selectedJanrs.removeAll { $0 == janrs[indexPath.item] }
                cell.contentView.backgroundColor = AppColor.color11.uiColor
                cell.janrlabel.textColor = .black
                cell.isAdded = false
            }
        }
    }

}
