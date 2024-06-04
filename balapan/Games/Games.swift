//
//  File.swift
//  balapan
//
//  Created by Nurbol on 01.06.2024.
//

import Foundation
import UIKit


struct AnimalGame: Hashable, Equatable {
    var word: String
    var image: UIImage
}

struct Card {
    let image: UIImage
    var isFlipped = false
    var isMatched = false
}

extension AnimalGame {
    static let gameQuestions = [
        AnimalGame(word: "Арыстан", image: UIImage(named: "arystan")!),
        AnimalGame(word: "Бұғы", image: UIImage(named: "bugy")!),
        AnimalGame(word: "Мүйізтұмсық", image: UIImage(named: "muyiztumsyq")!),
        AnimalGame(word: "Мысық", image: UIImage(named: "mysyq")!),
        AnimalGame(word: "Жолбарыс", image: UIImage(named: "zholbarys")!),
        AnimalGame(word: "Тышқан", image: UIImage(named: "tyshqan")!),
        AnimalGame(word: "Қоян", image: UIImage(named: "koian")!),
        AnimalGame(word: "Піл", image: UIImage(named: "pil")!),
        AnimalGame(word: "Үкі", image: UIImage(named: "uky")!),
    ]
}
