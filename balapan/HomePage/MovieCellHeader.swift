//
//  MovieCellHeader.swift
//  balapan
//
//  Created by Nurbol on 03.04.2024.
//

import UIKit

class MovieCellHeader: UICollectionReusableView {
    static let identifier = "MovieCellHeader"

    // MARK: - Outlets

    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
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
    }

    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
