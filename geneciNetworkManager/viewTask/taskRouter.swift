//
//  taskRouter.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/28/23.
//

import UIKit

protocol taskRouterProtocol {
    static func getTaskView() -> UIViewController
}

class taskRouter: taskRouterProtocol {
    static func getTaskView() -> UIViewController {
        let view = taskViewController()
        return view
    }
}
