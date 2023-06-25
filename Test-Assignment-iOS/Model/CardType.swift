//
//  CardType.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 24.06.2023.
//

import UIKit

enum CardType: Int, CaseIterable {
    case visa
    case mastercard
    
    var image: UIImage? {
        switch self {
        case .visa:
            return UIImage(named: "visaImage")
        case .mastercard:
            return UIImage(named: "mastercardImage")
        }
    }
}
