//
//  secondViewInteractor.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/19/23.
//

import Foundation

protocol secondViewInteractorProtocol {
    var worker: secondViewWorker? { get set }
    var presenter: secondViewPresenterProtocol? { get set }
}

class secondViewInteractor: secondViewInteractorProtocol {
    var worker: secondViewWorker?
    var presenter: secondViewPresenterProtocol?
}
