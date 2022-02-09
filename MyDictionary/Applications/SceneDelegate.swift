//
//  SceneDelegate.swift
//  MyDictionary
//
//  Created by Сергей Карпов on 08.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        guard let window = window else { return }
        window.overrideUserInterfaceStyle = .light
        coordinator = StartCoordinator(window: window)
        coordinator?.start()
        
    }
}

