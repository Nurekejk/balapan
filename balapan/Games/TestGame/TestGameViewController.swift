//
//  TestGameViewController.swift
//  balapan
//
//  Created by Nurbol on 25.05.2024.
//

import UIKit

class TestGameViewController: UIViewController {
    // MARK: - UI


    private var animalName: String = ""
    private var missingLetterIndex: Int = 0
    private var correctIndex: Int = 0
    private var options: [Character] = []
    private var questionNumber = 0

    private let questionContainer: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 20
        uiView.layer.shadowColor = AppColor.shadow.cgColor
        uiView.layer.shadowOpacity = 0.48
        uiView.layer.shadowRadius = 20
        return uiView
    }()

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.text = "Қай әріп жетіспей тұр?"
        label.textColor = AppColor.gray500.uiColor
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private var questionImage: UIImageView = {
        let uiImage = UIImageView()
        uiImage.clipsToBounds = true
        return uiImage
    }()
    private let levelLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = AppColor.blue300.uiColor
        return label
    }()
    private let allLevelsLabel: UILabel = {
        let label = UILabel()
        label.text = "/\(String(AnimalGame.gameQuestions.count))"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = AppColor.gray400.uiColor
        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AgeCollectionViewCell.self, forCellWithReuseIdentifier: AgeCollectionViewCell.identifier)
        collectionView.register(AnswerCollectionViewCell.self, forCellWithReuseIdentifier: AnswerCollectionViewCell.identifier)
        collectionView.isScrollEnabled = false
        return collectionView
    }()

    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.isHidden = true // Сначала скрываем вид
        return view
    }()

    private let gameOverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gameOver")
        imageView.clipsToBounds = true
        imageView.isHidden = true
        return imageView
    }()

    private let continuePlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.isHidden = true
        button.setTitle("Жалғастыру", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = AppColor.blue300.uiColor
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(continuePlayButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        generateAnimalQuestion(animalName: "Арыстан", image: UIImage(named: "arystan")!)

    }
    // MARK: - SetupViews
    func setupViews(){
        questionContainer.addSubview(questionImage)
        questionContainer.addSubview(questionLabel)
        view.addSubview(questionContainer)
        view.addSubview(levelLabel)
        view.addSubview(allLevelsLabel)
        view.addSubview(collectionView)   
        view.addSubview(overlayView)
        view.addSubview(gameOverImage)
        view.addSubview(continuePlayButton)


    }
    // MARK: - SetupConstraints
    func setupConstraints(){
        questionContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(122)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(310)
        }
        questionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(275)
            make.height.equalTo(70)
        }
        questionImage.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
        }
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(questionContainer.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(169)
            make.height.equalTo(30)
        }
        allLevelsLabel.snp.makeConstraints { make in
            make.top.equalTo(questionContainer.snp.bottom).offset(23)
            make.leading.equalTo(levelLabel.snp.trailing).offset(2)
            make.height.equalTo(30)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(levelLabel.snp.bottom).offset(41)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview()
        }
        overlayView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // Заставим overlayView занять весь экран
        }
        gameOverImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(225)
            make.centerX.equalToSuperview()
            make.width.equalTo(295)
            make.height.equalTo(285)
        }
        continuePlayButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(56)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }


    }

    func generateAnimalQuestion(animalName: String, image: UIImage) {
        // Генерация случайного индекса для пропущенной буквы
        let missingLetterIndex = Int(arc4random_uniform(UInt32(animalName.count)))
        let missingLetter = animalName[animalName.index(animalName.startIndex, offsetBy: missingLetterIndex)]

        // Правильный ответ - это пропущенная буква
        let correctAnswer = missingLetter

        // Генерация вариантов ответов
        var options = Set<Character>()
        options.insert(correctAnswer)

        while options.count < 4 {
            let randomCharacter = "әбвгғдеёжзийкқлмнңоөпрстуұүфхһцчшщыіьэюя".randomElement()!
            if randomCharacter != correctAnswer {
                options.insert(randomCharacter)
            }
        }

        // Преобразуем Set в Array и перемешаем массив
        var optionsArray = Array(options).shuffled()

        // Вставляем правильный ответ на случайное место среди вариантов ответов
        if !optionsArray.contains(correctAnswer) {
            let correctIndex = Int(arc4random_uniform(4))
            optionsArray[correctIndex] = correctAnswer
        }

        // Обновляем свойства экземпляра
        self.animalName = animalName
        self.missingLetterIndex = missingLetterIndex
        self.options = optionsArray
        self.correctIndex = optionsArray.firstIndex(of: correctAnswer) ?? 0
        questionImage.image = image
    }

    func updateQuestion() {
        // Генерация нового вопроса
        generateAnimalQuestion(animalName: "Новый вопрос", image: UIImage(named: "новое_изображение")!)
        // Обновление коллекции с новым вопросом
        collectionView.reloadData()
    }

    private func showGameOverView() {
        overlayView.isHidden = false
        gameOverImage.isHidden = false
        continuePlayButton.isHidden = false

        overlayView.alpha = 0
        gameOverImage.alpha = 0
        continuePlayButton.alpha = 0

        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 1
            self.gameOverImage.alpha = 1
            self.continuePlayButton.alpha = 1
        }
    }

    @objc private func continuePlayButtonTapped() {
        // Логика для перезапуска игры
        overlayView.isHidden = true
        gameOverImage.isHidden = true
        continuePlayButton.isHidden = true
        levelLabel.text = "1"
        questionNumber = 0
        generateAnimalQuestion(animalName: "Арыстан", image: UIImage(named: "arystan")!)
        collectionView.reloadData()
    }

}
extension TestGameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return animalName.count

        default:
            return 4
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.item == missingLetterIndex{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AgeCollectionViewCell.identifier, for: indexPath) as!     AgeCollectionViewCell
                cell.childAgelabel.text = "_"
                cell.layer.borderColor = AppColor.blue300.cgColor
                cell.layer.borderWidth = 2
                cell.layer.cornerRadius = 5
                cell.childAgelabel.textColor = AppColor.gray900.uiColor

                return cell
            }else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AgeCollectionViewCell.identifier, for: indexPath) as!     AgeCollectionViewCell
                let index = animalName.index(animalName.startIndex, offsetBy: indexPath.item)
                let character = animalName[index]
                cell.childAgelabel.text = String(character)
                cell.layer.borderWidth = 0
                cell.childAgelabel.textColor = AppColor.gray900.uiColor
                return cell
            }
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswerCollectionViewCell.identifier, for: indexPath) as!    AnswerCollectionViewCell
            cell.answerLabel.text = String(options[indexPath.item])
            cell.backgroundColor = .blue300
            cell.layer.cornerRadius = 20
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        CGSize(
            width: 20,
            height: 20
        )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            CGSize(
                width: 40,
                height: 70
            )
        default:
            CGSize(
                width: 160,
                height: 80
            )
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 2 {
            return 24
        } else {
            return 10
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if let cell = collectionView.cellForItem(at: indexPath) as? AnswerCollectionViewCell {
                if indexPath.item == correctIndex {
                    cell.answerLabel.backgroundColor = .green
                    cell.contentView.backgroundColor = .green
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        if self.questionNumber < AnimalGame.gameQuestions.count - 1 {
                            cell.prepareForReuse()
                            self.questionNumber += 1
                            self.levelLabel.text = String(self.questionNumber + 1)
                            self.generateAnimalQuestion(animalName: AnimalGame.gameQuestions[self.questionNumber].word, image: AnimalGame.gameQuestions[self.questionNumber].image)
                        } else {
                            print("Game Over. You win")
                            self.showGameOverView()
                        }
                        collectionView.reloadData()
                    }
                } else {
                    cell.answerLabel.backgroundColor = .red
                    cell.contentView.backgroundColor = .red
                    print("GameOver. You lose ")
                }
            }
        }
    }
}

