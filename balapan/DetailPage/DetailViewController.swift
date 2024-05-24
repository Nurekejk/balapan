//
//  DetailViewController.swift
//  balapan
//
//  Created by Nurbol on 12.05.2024.
//

import UIKit
import youtube_ios_player_helper

class DetailViewController: UIViewController, YTPlayerViewDelegate {

    private var video: Video


    // MARK: - UI

    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
        button.addTarget(self, action: #selector(playButtonDidPress(_:)), for: .touchUpInside)
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
        collectionView.backgroundColor = AppColor.color9.uiColor
        collectionView.layer.cornerRadius = 8
        return collectionView
    }()
    let playerView: YTPlayerView = {
        let playerView = YTPlayerView()
        return playerView
    }()


    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        loadData()
    }

    init(video: Video) {
        self.video = video
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
//    func setMovieConstraints(){
//        if(self.type < 2){
//            movieImage.snp.makeConstraints { make in
//                make.top.leading.trailing.equalToSuperview()
//                make.height.equalTo(550)
//            }
//        }else {
//            movieImage.snp.makeConstraints { make in
//                make.top.leading.trailing.equalToSuperview()
//                make.height.equalTo(550)
//            }
//        }
//    }
    func setupConstraints(){
        movieImage.snp.makeConstraints { make in
           make.top.leading.trailing.equalToSuperview()
           make.height.equalTo(550)
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


    func loadData(){
        if let url = URL(string: video.thumbnail) {
            loadImage(from: url, into: movieImage)
        }
        movieName.text = video.title
        shortDescription.text = video.shortDescription


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
        viewController.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)
        present(viewController, animated: true)
    }
    @objc private func playButtonDidPress(_ sender: UIButton) {
           view.addSubview(playerView)
           playerView.snp.makeConstraints { make in
               make.leading.trailing.top.bottom.equalToSuperview()
           }
           playerView.load(withVideoId: extractVideoID(from: video.url), playerVars: ["playsinline": 1])
       }

       private func extractVideoID(from url: String) -> String {
           // Предполагая, что видео ID всегда будет последним параметром в ссылке
           if let videoID = URLComponents(string: url)?.queryItems?.first(where: { $0.name == "v" })?.value {
               return videoID
           }
           return ""
       }

}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultCollectionViewCell.identifier, for: indexPath) as! DefaultCollectionViewCell
        cell.movieName.textColor = .white
        cell.categoryName.textColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieCellHeader.identifier, for: indexPath) as! MovieCellHeader
        header.title.text = "Сізге ұсынылады"
        header.title.textColor = .lightGray

        return header

    }


}
