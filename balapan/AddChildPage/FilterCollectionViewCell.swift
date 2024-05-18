//
//  FilterCollectionViewCell.swift
//  balapan
//
//  Created by Nurbol on 15.05.2024.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FilterCollectionViewCell"

    public var isAdded: Bool = false

    lazy var janrlabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = AppColor.color11.uiColor
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews() {
        contentView.addSubview(janrlabel)
    }

    private func setupConstraints () {
        janrlabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

}
