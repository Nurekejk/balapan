//
//  SearchCategoryCollectionViewCell.swift
//  balapan
//
//  Created by Nurbol on 27.03.2024.
//

import UIKit

class SearchCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCategoryCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    private let uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .orange
        uiView.layer.cornerRadius = 15
        return uiView
    }()

    private let balapanLabel: UILabel = {
        let label = UILabel()
        label.text = "Balapan"
        label.textColor = .white
        label.font = .italicSystemFont(ofSize: 14)
        return label
    }()
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Мультфильм"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage (named: "category")
        return imageView
    }()


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func  setupViews(){
        contentView.addSubview(uiView)
        contentView.addSubview(balapanLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(imageView)

    }

    private func  setupConstraints(){
        uiView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.leading.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(86)
        }
        balapanLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(91)
            make.leading.equalToSuperview().offset(24)
        }
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(uiView.snp.bottom).offset(7)
            make.centerX.equalTo(uiView.snp.centerX)
        }
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(75)
            make.bottom.equalTo(uiView.snp.bottom)

        }
    }


}
