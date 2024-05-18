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
                                    selectedImage: AppImage.home_selected.uiImage!,
                                    image: AppImage.home.uiImage!,
                                    viewController: HomeViewController()
        )
        let search = createNavigation(mainTitle: "Іздеу",
                                      selectedImage: AppImage.search_selected.uiImage!,
                                      image:  AppImage.search.uiImage!,
                                      viewController: SearchViewController()
        )
        let game = createNavigation(mainTitle: "Ойындар",
                                    selectedImage:  AppImage.game_selected.uiImage!,
                                    image: AppImage.game.uiImage!,
                                    viewController: GameViewController()
        )
        let profile = createNavigation(mainTitle: "Профиль",
                                       selectedImage:   AppImage.profile_selected.uiImage!,
                                       image: AppImage.profile.uiImage!,
                                       viewController: ProfileViewController()
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

