//
//  GameTableViewCell.swift
//  balapan
//
//  Created by Nurbol on 29.03.2024.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    lazy var mainContainer: UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius = 20
        return uiView
    }()

    
    lazy var gameCategory: UILabel = {
        let label = UILabel()
        label.text = "Әріптер"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    private let playContainer: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 83/255, green: 36/255, blue: 242/255, alpha: 1)
        uiView.layer.cornerRadius = 15
        return uiView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Play"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    private let playIcon: UIImageView = {
        let playIcon = UIImageView()
        playIcon.image = UIImage (named: "playIcon")
        return playIcon
    }()
    lazy var categoryImage: UIImageView = {
        let categoryImage = UIImageView()
        categoryImage.image = UIImage (named: "game1")
        return categoryImage
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        contentView.addSubview(mainContainer)
        mainContainer.addSubview(gameCategory)
        mainContainer.addSubview(playContainer)
        mainContainer.addSubview(categoryImage)
        playContainer.addSubview(label)
        playContainer.addSubview(playIcon)



    }

    private func setupLayout () {
        mainContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.trailing.equalToSuperview()
        }
        gameCategory.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(24)
        }
        categoryImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(128)
            make.height.equalTo(109)
        }
        playContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(77)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(66)
            make.height.equalTo(28)
        }
        playIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-42)
        }
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-11)
            make.centerY.equalToSuperview()
        }
    }


}



//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
