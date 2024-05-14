//
//  SeriesViewController.swift
//  balapan
//
//  Created by Nurbol on 14.05.2024.
//

import UIKit

class SeriesViewController: UIViewController {

    // MARK: - UI

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SezonsCollectionViewCell.self, forCellWithReuseIdentifier: SezonsCollectionViewCell.identifier)
        view.backgroundColor = .white
        collectionView.isScrollEnabled = true
        return collectionView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(SeriesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()


    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }


    // MARK: - SetupViews
    func setupViews(){
        view.addSubview(collectionView)
        view.addSubview(tableView)

    }
    // MARK: - SetupConstraints
    func setupConstraints(){
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(132)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(34)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview()
        }
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)

            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(85),
                                                   heightDimension: .estimated(34))

            let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem] )
            layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)

            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .continuous
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

extension SeriesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SezonsCollectionViewCell.identifier, for: indexPath) as! SezonsCollectionViewCell
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as? SeriesTableViewCell
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       224
    }



}
