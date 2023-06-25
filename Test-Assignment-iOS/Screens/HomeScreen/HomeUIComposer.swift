//
//  HomeUIComposer.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 24.06.2023.
//

import UIKit

enum HomeUIComposer {
    static func build(router: Router) -> UIViewController {
        return HomeTableViewController(viewModel: HomeTableViewModel(cardsService: CoreDataService()), router: router)
    }
}
