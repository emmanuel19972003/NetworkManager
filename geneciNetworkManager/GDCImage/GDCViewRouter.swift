//
//  GDCViewRouter.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/19/23.
//

import UIKit

protocol GDCViewRouterProtocol {
    static func getGDCView() -> UIViewController
}

class GDCViewRouter: GDCViewRouterProtocol {
    static func getGDCView() -> UIViewController {
        let router = GDCViewRouter()
        let viewController = GDCViewViewController()
        
        viewController.router = router
        
        return viewController
    }
}
