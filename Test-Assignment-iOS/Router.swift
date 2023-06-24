//
//  Router.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

final class Router {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showHomeScreenAsRootController() {
        let navigationController = UINavigationController(rootViewController: HomeTableViewController(viewModel: HomeTableViewModel()))
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showCardScreen(navigationController: UINavigationController, numberOfCard: String) {
        let viewController = CardViewController(numberOfCard: numberOfCard)
        navigationController.pushViewController(viewController, animated: true)
    }
}
