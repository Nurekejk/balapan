//
//  DetailViewController.swift
//  balapan
//
//  Created by Nurbol on 12.05.2024.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - UI

    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "simba")
        return imageView
    }()

    private let movieName: UILabel = {
        let label = UILabel()
        label.text = "Симба"
        label.font = .systemFont(ofSize: 36, weight: .semibold)
        label.textColor = .white
        return label
    }()

    private let shortDescription: UILabel = {
        let label = UILabel()
        label.text = "2020 * Телехикая * 5 сезон, 46 серия, 7 мин."
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()

    private let playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "playFrame"), for: .normal)
        button.clipsToBounds = true
        return button
    }()


    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addToFav"), for: .normal)
        button.setImage(UIImage(named: "addedToFav"), for: .highlighted)
        button.clipsToBounds = true
        return button
    }()

    private lazy var moreInfoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "moreInfo"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(moreInfoButtonDidPressed(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DefaultCollectionViewCell.self, forCellWithReuseIdentifier: DefaultCollectionViewCell.identifier)
        collectionView.register(MovieCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieCellHeader.identifier)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 8
        return collectionView
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }


    // MARK: - SetupViews
    func setupViews(){
        view.addSubview(movieImage)
        view.addSubview(movieName)
        view.addSubview(shortDescription)
        view.addSubview(addButton)
        view.addSubview(playButton)
        view.addSubview(moreInfoButton)
        view.addSubview(collectionView)

    }
    // MARK: - SetupConstraints
    func setupConstraints(){
        movieImage.snp.makeConstraints { make in
            make.top.leading.trailing.width.equalToSuperview()
        }
        movieName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.centerX.equalToSuperview()
        }
        shortDescription.snp.makeConstraints { make in
            make.top.equalTo(movieName.snp.bottom).offset(13)
            make.centerX.equalToSuperview()
        }
        addButton.snp.makeConstraints { make in
            make.top.equalTo(shortDescription.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.width.equalTo(78)
        }
        moreInfoButton.snp.makeConstraints { make in
            make.top.equalTo(shortDescription.snp.bottom).offset(23)
            make.trailing.equalToSuperview().offset(-24)
            make.width.equalTo(80)
        }
        playButton.snp.makeConstraints { make in
            make.top.equalTo(shortDescription.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(addButton.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)

            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(128),
                                                   heightDimension: .estimated(224))

            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem] )
            layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .continuous



            let layoutSectionHeaderSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.93),
                heightDimension: .estimated(80)
            )
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: layoutSectionHeaderSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 16,
                                                                  leading: 16,
                                                                  bottom: 16,
                                                                  trailing: 16)
            return layoutSection

        }
    }
    @objc private func moreInfoButtonDidPressed(_ sender: UIButton) {
        let viewController = MoreInfoViewController()
        viewController.modalPresentationStyle = .pageSheet
          present(viewController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


    */
   

}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultCollectionViewCell.identifier, for: indexPath) as! DefaultCollectionViewCell
        cell.movieName.textColor = .white
        cell.episodeNumber.textColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieCellHeader.identifier, for: indexPath) as! MovieCellHeader
        header.title.text = "Сізге ұсынылады"
        header.title.textColor = .lightGray

        return header

    }


}
