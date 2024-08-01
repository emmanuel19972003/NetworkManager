//
//  bankProtocols.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 23/07/24.
//

import Foundation
import UIKit

enum typeOfConcurrency: String{
    case GDC = "GDC"
    case GDCOnQ = "GDCOnQ"
    case actor = "Actor"
    case groupe = "Groupe"
    case lock = "Lock"
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
    
    func depositAccount1() 
    func depositAccount2()
    func depositAccount3()
    func depositAccount4()
    
    func WithdrawAccount1()
    func WithdrawAccount2()
    func WithdrawAccount3()
    func WithdrawAccount4()
    
    func MultipleAcction1()
    func MultipleAcction2() async
    
    func setPresenter(view: bankView, type: typeOfConcurrency)
}

protocol bankRouterProtocol: AnyObject {
    static func getBank(type: typeOfConcurrency) -> UIViewController
    func setPresenter(view: bankView, type: typeOfConcurrency)
}
