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

    private let moreInfoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "moreInfo"), for: .normal)
        button.clipsToBounds = true
        return button
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

    }
    // MARK: - SetupConstraints
    func setupConstraints(){
        movieImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.equalTo(470)
        }
        movieName.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
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
            make.width.equalTo(78)
        }
        playButton.snp.makeConstraints { make in
            make.top.equalTo(shortDescription.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
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
