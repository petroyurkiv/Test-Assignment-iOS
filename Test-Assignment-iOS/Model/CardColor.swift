//
//  CardColor.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 25.06.2023.
//

import Foundation

enum CardColor {
    case visaColor
    case mastercardColor
    
    var name: String {
        switch self {
        case .visaColor:
            return "FAAA13"
        case .mastercardColor:
            return "222222"
        }
    }
}
