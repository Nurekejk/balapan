//
//  SceneDelegate.swift
//  balapan
//
//  Created by Nurbol on 22.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        if isAuthorized() {
            window?.rootViewController = TabBarViewController()
    ()
        } else {
            window?.rootViewController =
            UINavigationController(rootViewController: HelloViewController())
        }
        window?.makeKeyAndVisible()
    }

    private func isAuthorized() -> Bool {
        let defaults = UserDefaults.standard
        var isAuthorized = false

        if let token = defaults.string(forKey: "userToken") {
            print("Token found: \(token)")
            isAuthorized = true
        } else {
            print("No token found in UserDefaults.")
            isAuthorized = false
        }

        return isAuthorized
    }

}
