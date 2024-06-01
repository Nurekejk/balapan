//
//  MoreInfoViewController.swift
//  balapan
//
//  Created by Nurbol on 13.05.2024.
//

import UIKit

class MoreInfoViewController: UIViewController {

    // MARK: - UI

    private let descriptionLabel = {
        let label = UILabel()
        label.text = "Сипаттама:"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()

    lazy var infoLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        label.text = "Шытырман оқиғалы мультсериал Елбасының «Ұлы даланың жеті қыры» бағдарламасы аясында жүзеге асырылған. Мақалада қызғалдақтардың отаны Қазақстан екені айтылады. Ал, жоба қызғалдақтардың отаны – Алатау баурайы екенін анимация тілінде дәлелдей түседі.Шытырман оқиғалы мультсериал Елбасының «Ұлы даланың жеті қыры» бағдарламасы аясында жүзеге асырылған. Мақалада қызғалдақтардың отаны Қазақстан екені айтылады. Ал, жоба қызғалдақтардың отаны – Алатау баурайы екенін анимация тілінде дәлелдей түседі."
        label.numberOfLines = .max
        return label
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    // MARK: - SetupViews

    func setupViews(){
        view.addSubview(descriptionLabel)
        view.addSubview(infoLabel)


    }

    // MARK: - SetupConstraints

    func setupConstraints(){
        descriptionLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(24)
            make.width.equalTo(81)
            make.height.equalTo(22)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(24)
            make.width.equalTo(327)
        }

    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
