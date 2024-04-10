//
//  TabBarController.swift
//  balapan
//
//  Created by Nurbol on 08.04.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        self.tabBar.backgroundColor = .white
    }

    // MARK: - Setup Views
    private func setupTabs() {
        let home = createNavigation(mainTitle: "Главный Экран",
                                    selectedImage: UIImage (named: "homeSelected")!,
                                    image: UIImage (named: "home")!,
                                    viewController: HomeViewController()
        )
        let search = createNavigation(mainTitle: "Іздеу",
                                      selectedImage: UIImage (named: "searchSelected")!,
                                      image: UIImage (named: "search")!,
                                      viewController: SearchViewController()
        )
        let game = createNavigation(mainTitle: "Ойындар",
                                    selectedImage: UIImage (named: "gameSelected")!,
                                    image: UIImage (named: "game")!,
                                    viewController: GameViewController()
        )
        let profile = createNavigation(mainTitle: "Профиль",
                                       selectedImage: UIImage (named: "profileSelected")!,
                                       image: UIImage (named: "profile")!,
                                       viewController: HomeViewController()
        )

        self.setViewControllers([home,search,game,profile], animated: true)
    }

    private func createNavigation(mainTitle: String,
                          selectedImage: UIImage,
                          image: UIImage,
                          viewController: UIViewController) -> UIViewController {
        let navViewController = UINavigationController(rootViewController: viewController)
        navViewController.tabBarItem.image = image
        navViewController.tabBarItem.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        
        return navViewController
    }
}

