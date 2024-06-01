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
        GameCategory(categoryName: "Әріптер", image: "game1", color: AppColor.color6.uiColor),
        GameCategory(categoryName: "Сандар", image: "game2", color:  AppColor.color5.uiColor),
        GameCategory(categoryName: "Түстер", image: "game3", color: AppColor.color4.uiColor),
        GameCategory(categoryName: "Жануарлар", image: "game4", color: AppColor.color7.uiColor),
        GameCategory(categoryName: "Пазлдар", image: "game5", color: AppColor.color8.uiColor),
    ]
}
