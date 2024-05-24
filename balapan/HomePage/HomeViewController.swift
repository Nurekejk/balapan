//
//  HomeViewController.swift
//  balapan
//
//  Created by Nurbol on 26.03.2024.
//

import UIKit

class HomeViewController: UIViewController {
    private let service = HomeService()
    var playlists: [Playlist] = []

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCells(for: collectionView)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        fetchPlaylists()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupViews() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func registerCells(for collectionView: UICollectionView) {
        collectionView.register(ContinueCollectionViewCell.self, forCellWithReuseIdentifier: ContinueCollectionViewCell.identifier)
        collectionView.register(NewCollectionViewCell.self, forCellWithReuseIdentifier: NewCollectionViewCell.identifier)
        collectionView.register(DefaultCollectionViewCell.self, forCellWithReuseIdentifier: DefaultCollectionViewCell.identifier)
        collectionView.register(MovieCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieCellHeader.identifier)
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            let layoutSection = self.createSection(for: sectionIndex)
            return layoutSection
        }
    }

    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)

        let groupSize: NSCollectionLayoutSize
        switch sectionIndex {
        case 0:
            groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .estimated(250))
        case 1:
            groupSize = NSCollectionLayoutSize(widthDimension: .estimated(200), heightDimension: .estimated(156))
        default:
            groupSize = NSCollectionLayoutSize(widthDimension: .estimated(128), heightDimension: .estimated(224))
        }

        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.boundarySupplementaryItems = [createHeader()]
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: sectionIndex == 0 ? 32 : 16, trailing: 16)

        return layoutSection
    }

    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(80))
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }

    private func fetchPlaylists() {
        service.getAllPlaylists { [weak self] result in
            switch result {
            case .success(var playlists):
                for playlist in playlists {
                    self?.playlists.insert(playlist, at: 0)
                }

                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print("Ошибка получения плейлистов: \(error)")
            }
        }
    }
    

    func loadImage(from url: URL, into imageView: UIImageView) {
        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Ошибка загрузки изображения: \(error)")
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                print("Ошибка преобразования данных в изображение")
                return
            }

            DispatchQueue.main.async {
                imageView.image = image
            }
        }
        task.resume()
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return playlists.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlists[section].videos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCollectionViewCell.identifier, for: indexPath) as!     NewCollectionViewCell
            if let url = URL(string: playlists[indexPath.section].videos[indexPath.item].thumbnail) {
                loadImage(from: url, into: cell.imageView)
            }
            cell.movieName.text = playlists[indexPath.section].videos[indexPath.item].title
            cell.shortDescription.text = playlists[indexPath.section].videos[indexPath.item].shortDescription
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContinueCollectionViewCell.identifier, for: indexPath) as!     ContinueCollectionViewCell
            if let url = URL(string: playlists[indexPath.section].videos[indexPath.item].thumbnail) {
                loadImage(from: url, into: cell.imageView)
            }
            cell.categoryName.text = playlists[indexPath.section].videos[indexPath.item].category
            cell.movieName.text = playlists[indexPath.section].videos[indexPath.item].title
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultCollectionViewCell.identifier, for: indexPath) as!     DefaultCollectionViewCell
            if let url = URL(string: playlists[indexPath.section].videos[indexPath.item].thumbnail) {
                loadImage(from: url, into: cell.imageView)
            }
            cell.movieName.text = playlists[indexPath.section].videos[indexPath.item].title
            cell.categoryName.text = playlists[indexPath.section].videos[indexPath.item].category
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieCellHeader.identifier, for: indexPath) as! MovieCellHeader
        header.title.text = playlists[indexPath.section].name
        return header
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailViewController(video: playlists[indexPath.section].videos[indexPath.item])
        controller.hidesBottomBarWhenPushed = true
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationItem.backBarButtonItem = backButton
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
