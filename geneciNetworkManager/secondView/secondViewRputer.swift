//
//  secondViewRputer.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/19/23.
//

import UIKit

protocol secondViewRputerProtocol {
    static func getsecondView() -> UIViewController
}

class secondViewRputer: secondViewRputerProtocol {
    static func getsecondView() -> UIViewController {
        let router = secondViewRputer()
        let viewController = secondViewViewController()
        let interactor = secondViewInteractor()
        let worker = secondViewWorker()
        let presenter = secondViewPresenter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.worker = worker
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        return viewController
    }
}
