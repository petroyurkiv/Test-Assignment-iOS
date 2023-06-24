//
//  CardUIComposer.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 24.06.2023.
//

import UIKit

enum CardUIComposer {
    static func build(card: Card) -> UIViewController {
        return CardViewController(viewModel: CardViewModel(card: card))
    }
}
