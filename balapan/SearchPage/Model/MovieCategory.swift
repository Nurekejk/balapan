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
    var categoryId: String
    var image: String
    var color: UIColor
}

extension MovieCategory {
    static let categoryArray = [
        MovieCategory(categoryName: "Мультфильм",categoryId: "664f37c1e319793accfbabd7", image: "category_1", color: AppColor.color1.uiColor),
        MovieCategory(categoryName: "Телехикая",categoryId: "664f3802e319793accfbabdb", image: "category_2", color: AppColor.color2.uiColor),
        MovieCategory(categoryName: "Көркем фильм", categoryId: "664f3813e319793accfbabde",image: "category_3", color: AppColor.color3.uiColor),
        MovieCategory(categoryName: "Отандық",categoryId: "664f3821e319793accfbabe1", image: "category_4", color: AppColor.color4.uiColor),
        MovieCategory(categoryName: "Аудармалар", categoryId: "664f3832e319793accfbabe4", image: "category_5", color: AppColor.color5.uiColor),
        MovieCategory(categoryName: "Жаңа", categoryId: "664f383fe319793accfbabe7", image: "category_6", color: AppColor.color6.uiColor),
    ]
}
