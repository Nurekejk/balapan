//
//  MovieCategory.swift
//  balapan
//
//  Created by Nurbol on 11.04.2024.
//

import Foundation
import UIKit

struct MovieCategory: Hashable {
    var categoryName: String?
    var image: String
    var color: UIColor
}

extension MovieCategory {
    static let categoryArray = [
        MovieCategory(categoryName: "Мультфильм", image: "category_1", color: AppColor.color1.uiColor),
        MovieCategory(categoryName: "Телехикая", image: "category_2", color: AppColor.color2.uiColor),
        MovieCategory(categoryName: "Көркем фильм", image: "category_3", color: AppColor.color3.uiColor),
        MovieCategory(categoryName: "Отандық", image: "category_4", color: AppColor.color4.uiColor),
        MovieCategory(categoryName: "Аудармалар", image: "category_5", color: AppColor.color5.uiColor),
        MovieCategory(categoryName: "Жаңа", image: "category_6", color: AppColor.color6.uiColor),
    ]
}
