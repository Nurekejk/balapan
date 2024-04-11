//
//  GameCategory.swift
//  balapan
//
//  Created by Nurbol on 11.04.2024.
//

import Foundation
import UIKit

struct GameCategory: Hashable {
    var categoryName: String?
    var image: String
    var color: UIColor
}

extension GameCategory {
    static let categoryArray = [
        MovieCategory(categoryName: "Әріптер", image: "game1", color: AppColor.color6.uiColor),
        MovieCategory(categoryName: "Сандар", image: "game2", color:  AppColor.color5.uiColor),
        MovieCategory(categoryName: "Түстер", image: "game3", color: AppColor.color4.uiColor),
        MovieCategory(categoryName: "Жануарлар", image: "game4", color: AppColor.color7.uiColor),
        MovieCategory(categoryName: "Пазлдар", image: "game5", color: AppColor.color8.uiColor),
    ]
}
