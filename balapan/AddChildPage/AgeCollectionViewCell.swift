//
//  AgeCollectionViewCell.swift
//  balapan
//
//  Created by Nurbol on 15.05.2024.
//

import UIKit

class AgeCollectionViewCell: UICollectionViewCell {

    static let identifier = "AgeCollectionViewCell"

    lazy var childAgelabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .lightGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews() {
        contentView.addSubview(childAgelabel)
    }

    private func setupConstraints () {
        childAgelabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

}
