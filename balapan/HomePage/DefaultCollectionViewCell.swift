//
//  DefaultCollectionViewCell.swift
//  balapan
//
//  Created by Nurbol on 04.04.2024.
//

import UIKit

class DefaultCollectionViewCell: UICollectionViewCell {

     static let identifier = "DefaultCollectionViewCell"

    lazy var imageView: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage (named: "aidar")
         imageView.layer.cornerRadius = 8
         imageView.clipsToBounds = true
         imageView.contentMode = .scaleToFill
         return imageView
     }()
    lazy var movieName: UILabel = {
         let label = UILabel()
         label.text = "Айдар"
         label.textColor = .black
         label.font = .systemFont(ofSize: 12, weight: .semibold)
         return label
     }()
    lazy var categoryName: UILabel = {
         let label = UILabel()
         label.text = "Мультсериал"
         label.textColor = .gray
         label.font = .systemFont(ofSize: 12, weight: .thin)
         return label
     }()


     override init(frame: CGRect) {
         super.init(frame: frame)
         setupViews()
         setupConstraints()
     }
    override func prepareForReuse() {
        super.prepareForReuse()
        movieName.text = ""
        categoryName.text = ""
        imageView.image = nil
        }

     required init?(coder: NSCoder) {
         fatalError("ERROR")
     }
     private func setupViews(){
         contentView.addSubview(imageView)
         contentView.addSubview(movieName)
         contentView.addSubview(categoryName)

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
         categoryName.snp.makeConstraints { make in
             make.top.equalTo(movieName.snp.bottom).offset(8)
             make.leading.trailing.equalToSuperview()

         }
     }

 }
