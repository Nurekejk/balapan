////
////  TestGameViewController.swift
////  balapan
////
////  Created by Nurbol on 25.05.2024.
////
//
//import UIKit
//
//class TestGameViewController: UIViewController {
//    // MARK: - UI
//
//    private let word: String = "Арыстан"
//
//    private let questionContainer: UIView = {
//        let uiView = UIView()
//
//        return uiView
//    }()
//
//    private let questionLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 28, weight: .semibold)
//        label.text = "Қай әріп жетіспей тұр?"
//        return label
//    }()
//
//    private let questionImage: UIImageView = {
//        let uiImage = UIImageView()
//        uiImage.clipsToBounds = true
//        return uiImage
//    }()
//    private let levelLabel: UILabel = {
//        let label = UILabel()
//        label.text = "1"
//        return label
//    }()
//    private let allLevelsLabel: UILabel = {
//        let label = UILabel()
//        label.text = "10"
//        return label
//    }()
//
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(AgeCollectionViewCell.self, forCellWithReuseIdentifier: AgeCollectionViewCell.identifier)
//        collectionView.register(AnswerCollectionViewCell.self, forCellWithReuseIdentifier: AnswerCollectionViewCell.identifier)
//        view.backgroundColor = .white
//        collectionView.isScrollEnabled = false
//        return collectionView
//    }()
//
//
//    // MARK: - ViewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        setupConstraints()
//
//    }
//    // MARK: - SetupViews
//    func setupViews(){
//        questionContainer.addSubview(questionImage)
//        questionContainer.addSubview(questionLabel)
//        view.addSubview(questionContainer)
//
//    }
//    // MARK: - SetupConstraints
//    func setupConstraints(){
//        questionContainer.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(122)
//            make.leading.equalToSuperview().offset(25)
//            make.trailing.equalToSuperview().offset(-25)
//            make.height.equalTo(310)
//        }
//        questionLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(12)
//            make.centerY.equalToSuperview()
//            make.height.equalTo(70)
//        }
//        questionImage.snp.makeConstraints { make in
//            make.top.equalTo(questionLabel.snp.bottom).offset(20)
//            make.centerY.equalToSuperview()
//            make.height.equalTo(200)
//        }
//        levelLabel.snp.makeConstraints { make in
//            make.top.equalTo(questionContainer.snp.bottom).offset(23)
//            make.leading.equalToSuperview().offset(169)
//            make.height.equalTo(30)
//        }
//        levelLabel.snp.makeConstraints { make in
//            make.top.equalTo(questionContainer.snp.bottom).offset(23)
//            make.leading.equalToSuperview().offset(169)
//            make.height.equalTo(30)
//        }
//        allLevelsLabel.snp.makeConstraints { make in
//            make.top.equalTo(questionContainer.snp.bottom).offset(23)
//            make.leading.equalToSuperview().offset(-169)
//            make.height.equalTo(30)
//
//        }
//        collectionView.snp.makeConstraints { make in
//            make.top.equalTo(levelLabel.snp.bottom).offset(41)
//            make.leading.equalToSuperview().offset(46)
//            make.trailing.equalToSuperview().offset(-46)
//            make.bottom.equalToSuperview()
//        }
//
//
//    }
//
//
//}
//extension TestGameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return word.count
//
//        default:
//            return 4
//        }   
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch indexPath.section {
//        case 0:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AgeCollectionViewCell.identifier, for: indexPath) as!     AgeCollectionViewCell
//            cell.childAgelabel.text = word[indexPath.item]
//            return cell
//        default:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswerCollectionViewCell.identifier, for: indexPath) as!     AnswerCollectionViewCell
//
//            return cell
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch indexPath.section {
//        case 0:
//            CGSize(
//                    width: 40,
//                    height: 70
//                )
//        default:
//            CGSize(
//                    width: 40,
//                    height: 70
//                )
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        if let cell = collectionView.cellForItem(at: indexPath) as? AgeCollectionViewCell {
////            cell.childAgelabel.textColor = AppColor.blue300.uiColor
////            cell.layer.borderColor = AppColor.blue300.cgColor
////            cell.layer.cornerRadius = 5
////            cell.layer.borderWidth = 2
////            self.selectedAge = ages[indexPath.item]
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
////        if let cell = collectionView.cellForItem(at: indexPath) as? AgeCollectionViewCell {
////            cell.childAgelabel.textColor = AppColor.gray500.uiColor
////            cell.layer.cornerRadius = 0
////            cell.layer.borderWidth = 0
//
//        }
//    }
//}
//
