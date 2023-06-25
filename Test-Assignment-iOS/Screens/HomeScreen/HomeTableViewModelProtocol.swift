//
//  HomeTableViewModelProtocool.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 24.06.2023.
//

import Foundation

protocol HomeTableViewModelProtocol {
    var onListUpdate: (([Card]) -> Void)? { get set }
    func onLoad()
    func onPlusTap()
}
