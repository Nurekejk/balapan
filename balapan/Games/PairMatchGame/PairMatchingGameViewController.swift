import UIKit

class PairMatchingGameViewController: UIViewController {

    // MARK: - Properties

    private var cardImages: [UIImage] = []
    private var cards: [Card] = []
    private var firstFlippedCardIndex: IndexPath?
    private let cardNames = ["arystan", "bugy", "muyiztumsyq", "mysyq", "zholbarys", "tyshqan", "koian", "pil", "uky", "flamingo", "zebra", "kiik"]
    private var matchesFound = 0
    private var totalPairs = 0
    private var isProcessing = false

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.text = "Cынарың тап"
        label.textColor = AppColor.gray500.uiColor
        label.textAlignment = .center
        label.numberOfLines = 2
        label.layer.shadowColor = AppColor.shadow.cgColor
        label.layer.shadowOpacity = 0.48
        label.layer.shadowRadius = 20
        return label
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
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

    private let levelLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = AppColor.blue300.uiColor
        return label
    }()
    private let allLevelsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = AppColor.gray400.uiColor
        return label
    }()

    private let continuePlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.isHidden = true
        button.setTitle("Жалғастыру", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = AppColor.blue300.uiColor
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(playAgainTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        setupGame()
    }

    // MARK: - Setup Views

    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        view.addSubview(questionLabel)
        view.addSubview(levelLabel)
        view.addSubview(allLevelsLabel)
        view.addSubview(overlayView)
        view.addSubview(gameOverImage)
        view.addSubview(continuePlayButton)
    }

    // MARK: - Setup Constraints

    func setupConstraints() {
        questionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(122)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(48)
        }
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(169)
            make.height.equalTo(30)
        }
        allLevelsLabel.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(20)
            make.leading.equalTo(levelLabel.snp.trailing).offset(2)
            make.height.equalTo(30)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(allLevelsLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-70)
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

    // MARK: - Game Setup

    func setupGame() {

        totalPairs = cardNames.count
        allLevelsLabel.text = "/\(String(totalPairs))"


        // Load images for the cards
        cardImages = cardNames.compactMap { UIImage(named: $0) }

        // Ensure we have pairs and shuffle the deck
        cards = (cardImages + cardImages).map { Card(image: $0) }.shuffled()
        collectionView.reloadData()
    }

    @objc func playAgainTapped() {
        matchesFound = 0
        levelLabel.text = "0"
        firstFlippedCardIndex = nil
        setupGame()
        overlayView.isHidden = true
        gameOverImage.isHidden = true
        continuePlayButton.isHidden = true
    }

    func checkForMatch(_ secondFlippedCardIndex: IndexPath) {
        guard let firstIndex = firstFlippedCardIndex else { return }
        let firstCard = cards[firstIndex.row]
        let secondCard = cards[secondFlippedCardIndex.row]

        if firstCard.image == secondCard.image {
            cards[firstIndex.row].isMatched = true
            cards[secondFlippedCardIndex.row].isMatched = true
            matchesFound += 1
            levelLabel.text = String(matchesFound)
            if matchesFound == totalPairs{
                showGameOverView()
            }
        } else {
            cards[firstIndex.row].isFlipped = false
            cards[secondFlippedCardIndex.row].isFlipped = false
        }
        collectionView.reloadItems(at: [firstIndex, secondFlippedCardIndex])
        firstFlippedCardIndex = nil
        isProcessing = false
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
}

extension PairMatchingGameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        let card = cards[indexPath.row]
        cell.configure(with: card)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isProcessing {
            return
        }

        var card = cards[indexPath.row]
        if card.isFlipped || card.isMatched {
            return
        }

        card.isFlipped = true
        cards[indexPath.row] = card
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        cell.flip()

        if firstFlippedCardIndex == nil {
            firstFlippedCardIndex = indexPath
        } else {
            isProcessing = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.checkForMatch(indexPath)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding * 4
        return CGSize(width: collectionViewSize / 4, height: collectionViewSize / 4)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

// MARK: - Card Model




