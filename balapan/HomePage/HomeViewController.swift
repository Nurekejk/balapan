//
//  HomeViewController.swift
//  balapan
//
//  Created by Nurbol on 26.03.2024.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContinueCollectionViewCell.self, forCellWithReuseIdentifier: ContinueCollectionViewCell.identifier)
        collectionView.register(NewCollectionViewCell.self, forCellWithReuseIdentifier: NewCollectionViewCell.identifier)
        collectionView.register(DefaultCollectionViewCell.self, forCellWithReuseIdentifier: DefaultCollectionViewCell.identifier)
        collectionView.register(MovieCellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieCellHeader.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.leading.trailing.equalToSuperview()
        }

    }
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in

            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)

                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(200),
                                                       heightDimension: .estimated(156))

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
                                                                      bottom: 32,
                                                                      trailing: 16)


                return layoutSection
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)

                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300),
                                                       heightDimension: .estimated(250))

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


            default:
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
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        10
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContinueCollectionViewCell.identifier, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCollectionViewCell.identifier, for: indexPath)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultCollectionViewCell.identifier, for: indexPath)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieCellHeader.identifier, for: indexPath) as! MovieCellHeader
            header.title.text = "Қарауды жалғастырыңыз"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieCellHeader.identifier, for: indexPath) as! MovieCellHeader
            header.title.text = "Жаңа"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieCellHeader.identifier, for: indexPath) as! MovieCellHeader
            header.title.text = "Шетель фильмдері"
            return header
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

