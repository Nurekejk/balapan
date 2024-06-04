//
//  AnswerCollectionViewCell.swift
//  balapan
//
//  Created by Nurbol on 25.05.2024.
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AnswerCollectionViewCell"

    lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 56, weight: .bold)
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        contentView.backgroundColor = AppColor.blue300.uiColor
        contentView.layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews() {
        contentView.addSubview(answerLabel)
    }

    private func setupConstraints () {
        answerLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        answerLabel.text = ""
        answerLabel.backgroundColor = AppColor.blue300.uiColor
        contentView.backgroundColor = AppColor.blue300.uiColor
        }

}
