//
//  bankProtocols.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 23/07/24.
//

import Foundation
import UIKit

enum typeOfConcurrency{
    case GDC
    case actor
    case groupe
}

protocol bankViewProtocol: UIViewController {
    var presenter: bankPresenterProtocol? {get set}
    func upDateAccount1(value: String)
    func upDateAccount2(value: String)
    func upDateAccount3(value: String)
    func upDateAccount4(value: String)
}

protocol bankPresenterProtocol: AnyObject {
    var view: bankViewProtocol? {get set}
    var router: bankRouterProtocol? {get set}
    
    func depositAccount1() async
    func depositAccount2() async
    func depositAccount3() async
    func depositAccount4() async
    
    func WithdrawAccount1() async
    func WithdrawAccount2() async
    func WithdrawAccount3() async
    func WithdrawAccount4() async
}

protocol bankRouterProtocol: AnyObject {
    static func getBank(type: typeOfConcurrency) -> UIViewController
}
