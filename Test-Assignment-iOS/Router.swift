//
//  Router.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

class Router {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showHomeScreenAsRootController() {
        let navigationController = UINavigationController(rootViewController: HomeTableViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showCardScreen(navigationController: UINavigationController) {
        let viewController = CardViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
