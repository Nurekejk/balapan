//
//  NewCollectionViewCell.swift
//  balapan
//
//  Created by Nurbol on 03.04.2024.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {
   
    static let identifier = "NewCollectionViewCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage (named: "movie-1")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private let movieName: UILabel = {
        let label = UILabel()
        label.text = "Ойыншықтар"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    private let episodeNumber: UILabel = {
        let label = UILabel()
        label.text = "5 жасар Алуаның ойыншықтары өте көп. Ол барлығын бірдей жақсы көріп, ұқыпты, таза ұстайды"
        label.numberOfLines = 3
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12, weight: .thin)
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }
    private func setupViews(){
        contentView.addSubview(imageView)
        contentView.addSubview(movieName)
        contentView.addSubview(episodeNumber)

    }

    private func  setupConstraints(){
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(164)
        }
        movieName.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.equalToSuperview()
        }
        episodeNumber.snp.makeConstraints { make in
            make.top.equalTo(movieName.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()

        }
    }

}
