//
//  bankRouter.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 23/07/24.
//

import Foundation
import UIKit

final class bankRouter: bankRouterProtocol {
    static func getBank(type: typeOfConcurrency = .GDC) -> UIViewController {
        let view = bankView()
        var presenter: bankPresenterProtocol
        
        switch type {
        case .GDC:
            presenter = bankPresenterGDC()
            view.typeOfPresenter = "GDC"
        case .GDCOnQ:
            presenter = bankPresenterGDConQ()
            view.typeOfPresenter = "GDC on Q"
        case .actor:
            presenter = bankPresenterActor()
            view.typeOfPresenter = "Actor"
        case .groupe:
            presenter = bankPresenterGDC()
            view.typeOfPresenter = "groupe"
        }
       
        let router = bankRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
