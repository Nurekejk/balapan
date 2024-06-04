//
//  CardCollectionViewCell.swift
//  balapan
//
//  Created by Nurbol on 04.06.2024.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    static let identifier = "CardCollectionViewCell"

    private let frontImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isHidden = true
        return imageView
    }()

    private let backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(frontImageView)
        contentView.addSubview(backImageView)
        frontImageView.frame = contentView.bounds
        backImageView.frame = contentView.bounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with card: Card) {
        frontImageView.image = card.image
        frontImageView.isHidden = !card.isFlipped
        backImageView.isHidden = card.isFlipped
    }

    func flip() {
        let fromView = frontImageView.isHidden ? backImageView : frontImageView
        let toView = frontImageView.isHidden ? frontImageView : backImageView
        UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
}
