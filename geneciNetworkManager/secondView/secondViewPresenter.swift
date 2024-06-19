//
//  secondViewPresenter.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/19/23.
//

import Foundation

protocol secondViewPresenterProtocol {
    var viewController: secondViewViewControllerProtocol? { get set }
}

class secondViewPresenter: secondViewPresenterProtocol{
    var viewController: secondViewViewControllerProtocol?
}
