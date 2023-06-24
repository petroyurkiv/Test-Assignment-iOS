//
//  Router.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

class Router {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showHomeScreenAsRootController() {
        navigationController?.setViewControllers([HomeUIComposer.build(router: self)], animated: true)
    }
    
    func showCardScreen(card: Card) {
        navigationController?.pushViewController(CardUIComposer.build(card: card), animated: true)
    }
}
