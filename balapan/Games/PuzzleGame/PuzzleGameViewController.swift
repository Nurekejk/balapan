//
//  PuzzleGameViewController.swift
//  balapan
//
//  Created by Nurbol on 25.05.2024.
//

import UIKit

class PuzzleGameViewController: UIViewController {
    // MARK: - UI

    private var puzzleImage: UIImage!
    private var puzzlePieces: [UIImageView] = []
    private var pieceSize: CGSize!
    private var originalPositions: [CGRect] = []
    private var shuffledPositions: [CGRect] = []

    private let questionContainer: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 20
        uiView.layer.shadowColor = UIColor.gray.cgColor
        uiView.layer.shadowOpacity = 0.48
        uiView.layer.shadowRadius = 20
        return uiView
    }()

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.text = "Собери пазл"
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private let puzzleContainer: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 20
        uiView.layer.borderWidth = 2
        uiView.layer.borderColor = UIColor.lightGray.cgColor
        return uiView
    }()

    private let levelLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.blue
        return label
    }()

    private let allLevelsLabel: UILabel = {
        let label = UILabel()
        label.text = "/10"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.gray
        return label
    }()

    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.isHidden = true
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
        button.backgroundColor = UIColor.blue
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
        setupPuzzle(image: UIImage(named: "lev")!)
    }

    // MARK: - SetupViews

    func setupViews() {
        questionContainer.addSubview(questionLabel)
        view.addSubview(questionContainer)
        view.addSubview(levelLabel)
        view.addSubview(allLevelsLabel)
        view.addSubview(puzzleContainer)
        view.addSubview(overlayView)
        view.addSubview(gameOverImage)
        view.addSubview(continuePlayButton)
    }

    // MARK: - SetupConstraints

    func setupConstraints() {
        questionContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(122)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(80)
        }
        questionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
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
        puzzleContainer.snp.makeConstraints { make in
            make.top.equalTo(levelLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.bottom.equalToSuperview().offset(-40)
        }
        overlayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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

    // MARK: - Puzzle Setup

    func setupPuzzle(image: UIImage) {
        puzzleImage = image
        let rows = 3
        let cols = 3
        pieceSize = CGSize(width: puzzleImage.size.width / CGFloat(cols), height: puzzleImage.size.height / CGFloat(rows))

        for row in 0..<rows {
            for col in 0..<cols {
                let pieceFrame = CGRect(x: CGFloat(col) * pieceSize.width, y: CGFloat(row) * pieceSize.height, width: pieceSize.width, height: pieceSize.height)
                let pieceImage = cropImage(puzzleImage, toRect: pieceFrame)
                let pieceImageView = UIImageView(image: pieceImage)
                pieceImageView.frame = pieceFrame
                pieceImageView.isUserInteractionEnabled = true
                puzzlePieces.append(pieceImageView)
                originalPositions.append(pieceFrame)
                puzzleContainer.addSubview(pieceImageView)
            }
        }
        shufflePuzzlePieces()
    }

    func cropImage(_ image: UIImage, toRect rect: CGRect) -> UIImage? {
        guard let cgImage = image.cgImage?.cropping(to: rect) else { return nil }
        return UIImage(cgImage: cgImage)
    }

    func shufflePuzzlePieces() {
        shuffledPositions = originalPositions.shuffled()
        for (index, piece) in puzzlePieces.enumerated() {
            piece.frame = shuffledPositions[index]
            addPanGesture(to: piece)
        }
    }

    func addPanGesture(to piece: UIImageView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        piece.addGestureRecognizer(panGesture)
    }

    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        guard let piece = sender.view else { return }
        switch sender.state {
        case .began, .changed:
            movePiece(piece, sender: sender)
        case .ended:
            checkPiecePosition(piece)
        default:
            break
        }
    }

    func movePiece(_ piece: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        piece.center = CGPoint(x: piece.center.x + translation.x, y: piece.center.y + translation.y)
        sender.setTranslation(.zero, in: view)
    }

    func checkPiecePosition(_ piece: UIView) {
        for (index, correctFrame) in originalPositions.enumerated() {
            if piece.frame.intersects(correctFrame) {
                UIView.animate(withDuration: 0.3) {
                    piece.frame = correctFrame
                }
                piece.isUserInteractionEnabled = false
                break
            }
        }
        if puzzlePieces.allSatisfy({ !$0.isUserInteractionEnabled }) {
            showGameOverView()
        }
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
        overlayView.isHidden = true
        gameOverImage.isHidden = true
        continuePlayButton.isHidden = true
        levelLabel.text = "1"
        shufflePuzzlePieces()
    }
}
