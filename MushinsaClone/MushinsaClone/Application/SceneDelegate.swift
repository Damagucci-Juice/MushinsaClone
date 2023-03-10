//
//  SceneDelegate.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ItemListViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

