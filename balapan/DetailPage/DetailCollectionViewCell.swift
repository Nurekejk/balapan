//
//  DetailCollectionViewCell.swift
//  balapan
//
//  Created by Nurbol on 13.05.2024.
//

import UIKit

class DetailCollectionViewCell: UICollectionReusableView {
    static let identifier = "DetailCollectionViewCell"

    // MARK: - Outlets

    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private lazy var allMoviesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Барлығы", for: .normal)
        button.setTitleColor(AppColor.color10.uiColor, for: .normal)
        button.clipsToBounds = true
        return button
    }()


    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(title)
        addSubview(allMoviesButton)

    }

    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(250)
        }
        allMoviesButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
