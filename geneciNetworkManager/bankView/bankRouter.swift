//
//  bankRouter.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 23/07/24.
//

import Foundation
import UIKit

final class bankRouter: bankRouterProtocol {
    static func getBank(type: typeOfConcurrency = .actor) -> UIViewController {
        let view = bankView()
        var presenter: bankPresenterProtocol
        
        switch type {
        case .GDC:
            presenter = bankPresenterGDC()
        case .actor:
            presenter = bankPresenterActor()
        case .groupe:
            presenter = bankPresenterGDC()
        }
       
        let router = bankRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
