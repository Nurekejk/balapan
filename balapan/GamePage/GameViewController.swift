//
//  GameViewController.swift
//  balapan
//
//  Created by Nurbol on 27.03.2024.
//

import UIKit

class GameViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(GameTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()

        // Do any additional setup after loading the view.
    }

    private func setupViews(){
        view.addSubview(tableView)


    } 
    private func setupConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(112)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalToSuperview()
        }
    }


}

extension GameViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameCategory.categoryArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as? GameTableViewCell
        cell?.categoryImage.image = UIImage(named: GameCategory.categoryArray[indexPath.item].image)
        cell?.mainContainer.backgroundColor = GameCategory.categoryArray[indexPath.item].color
        cell?.gameCategory.text = GameCategory.categoryArray[indexPath.item].categoryName
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        125+16
    }
}
