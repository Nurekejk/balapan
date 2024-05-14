//
//  AddChildViewController.swift
//  balapan
//
//  Created by Nurbol on 14.05.2024.
//

import UIKit


enum ControllerMode {
    case boy
    case girl
}

class AddChildViewController: UIViewController {

    // MARK: - UI

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Есімі"
        return label
    }()

    private let childNameTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Баланың есімі"
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = .init(red: 229/255, green: 235/255, blue: 240/255, alpha: 1)
        return textField
    }()



    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    // MARK: - SetupViews
    func setupViews(){

    }
    // MARK: - SetupConstraints
    func setupConstraints(){

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
