//
//  CardViewModelProtocol.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 24.06.2023.
//

import Foundation

protocol CardViewModelProtocol {
    var onDisplayCard: ((Card) -> Void)? { get set }
    func onLoad()
}
