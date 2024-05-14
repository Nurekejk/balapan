//
//  SezonsCollectionViewCell.swift
//  balapan
//
//  Created by Nurbol on 14.05.2024.
//

import UIKit

class SezonsCollectionViewCell: UICollectionViewCell {
  
    static let identifier = "SezonsCollectionViewCell"

   lazy var numberOfSezon: UILabel = {
        let label = UILabel()
        label.text = "1 сезон"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = AppColor.color11.uiColor
        contentView.layer.cornerRadius = 8
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }
    private func setupViews(){
        contentView.addSubview(numberOfSezon)

    }

    private func  setupConstraints(){
        numberOfSezon.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()

        }
    }

}
