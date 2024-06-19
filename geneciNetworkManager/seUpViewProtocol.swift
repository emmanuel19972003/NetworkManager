//
//  seUpViewProtocol.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/14/23.
//

import Foundation

protocol seUpViewProtocol {
    func viewComponets()
    func viewConstrains()
}

extension seUpViewProtocol {
    func setupView() {
        viewComponets()
        viewConstrains()
    }
}


