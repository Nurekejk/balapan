//
//  CategoryTableViewCell.swift
//  balapan
//
//  Created by Nurbol on 18.05.2024.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    private let mainContainer: UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius = 10
        uiView.backgroundColor = .white
        return uiView
    }()

    lazy var movieImage: UIImageView = {
        let movieImage = UIImageView()
        movieImage.image = UIImage (named: "simba-2")
        movieImage.layer.cornerRadius = 5
        movieImage.clipsToBounds = true
        return movieImage
    }()
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Cимба"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "2020 * Телехикая * Мультфильм"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()

    private let watchUIControl: UIControl = {
        let uiControl = UIControl()
        uiControl.layer.cornerRadius = 8
        uiControl.backgroundColor = AppColor.color13.uiColor
//        uiControl.addTarget(self, action: #selector(boyUIControlDidPressed), for: .touchUpInside)
        return uiControl
    }()
    private let watchLabel: UILabel = {
        let label = UILabel()
        label.text = "Қарау"
        label.textColor = AppColor.color12.uiColor
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()

    private let watchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "playCategory")
        return imageView
    }()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = AppColor.color11.uiColor
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        mainContainer.addSubview(movieImage)
        mainContainer.addSubview(movieNameLabel)
        mainContainer.addSubview(descriptionLabel)
        watchUIControl.addSubview(watchIcon)
        watchUIControl.addSubview(watchLabel)
        mainContainer.addSubview(watchUIControl)
        contentView.addSubview(mainContainer)
    }

    private func setupConstraints () {
        mainContainer.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(6)
            make.trailing.bottom.equalToSuperview().offset(-6)
        }
        movieImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(78)
            make.height.equalTo(85)
        }
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12.5)
            make.leading.equalTo(movieImage.snp.trailing).offset(11)
            make.width.equalTo(148)
            make.height.equalTo(40)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(movieImage.snp.trailing).offset(11)
            make.width.equalTo(200)
            make.height.equalTo(13)
        }
        watchUIControl.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().offset(-6)
            make.width.equalTo(80)
            make.height.equalTo(26)
        }
        watchIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        watchLabel.snp.makeConstraints { make in
            make.leading.equalTo(watchIcon.snp.trailing).offset(4)
            make.centerY.equalToSuperview()
            make.height.equalTo(18)
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
