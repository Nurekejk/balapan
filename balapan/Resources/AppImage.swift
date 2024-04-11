//
//  AppImage.swift
//  balapan
//
//  Created by Nurbol on 11.04.2024.
//

import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }

    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }

}

enum AppImage: String, AppImageProtocol {
    case home = "home"
    case home_selected = "home_selected"
    case game = "game"
    case game_selected = "game_selected"
    case search = "search"
    case search_selected = "search_selected"
    case profile = "profile"
    case profile_selected = "profile_selected"
    case hello = "hello"
    case search_icon = "search_icon"
    

}
