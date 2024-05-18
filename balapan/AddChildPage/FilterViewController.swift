//
//  FilterViewController.swift
//  balapan
//
//  Created by Nurbol on 15.05.2024.
//

import UIKit

class FilterViewController: UIViewController {

    private var janrs = ["Музыка", "Спорт", "Сурет", "Ғарыш", "Тарих", "Математика", "Көліктер" , "Ертегілер", "Батырлар"]
    private var selectedJanrs: Set<String> = []


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
        return button
    }()

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
                selectedJanrs.insert(janrs[indexPath.item])
                cell.contentView.backgroundColor = AppColor.color12.uiColor
                cell.janrlabel.textColor = .white
                cell.isAdded = true
            } else {
                selectedJanrs.remove(janrs[indexPath.item])
                cell.contentView.backgroundColor = AppColor.color11.uiColor
                cell.janrlabel.textColor = .black
                cell.isAdded = false
            }
        }
    }

}
