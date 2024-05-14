//
//  SeriesTableViewCell.swift
//  balapan
//
//  Created by Nurbol on 14.05.2024.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {

    lazy var numberOfSerie: UILabel = {
        let label = UILabel()
        label.text = "1-ші бөлім"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private let thumbnail: UIImageView = {
        let thumbnail = UIImageView()
        thumbnail.image = UIImage (named: "simba-1")
        thumbnail.clipsToBounds = true
        thumbnail.layer.cornerRadius = 10
        return thumbnail
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(thumbnail)
        contentView.addSubview(numberOfSerie)
    }

    private func setupConstraints () {
        thumbnail.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(178)
        }
        numberOfSerie.snp.makeConstraints { make in
            make.top.equalTo(thumbnail.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.height.equalTo(37)
        }
    }

}
