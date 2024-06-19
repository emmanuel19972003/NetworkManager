//
//  secondViewWorker.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/19/23.
//

import Foundation

protocol secondViewWorkerProtocol {
    var interactor: secondViewInteractorProtocol? {get set}
}

protocol useCauses {
}

class secondViewWorker: secondViewWorkerProtocol, useCauses {
    var interactor: secondViewInteractorProtocol?
}
