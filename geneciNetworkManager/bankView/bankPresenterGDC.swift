//
//  bankPresenter.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 23/07/24.
//

import Foundation

final class bankPresenterGDC: bankPresenterProtocol {
    
    weak var view: bankViewProtocol?
    
    var router: bankRouterProtocol?
    
    func depositAccount1()  {
        print("depositAccount1")
        view?.upDateAccount1(value: "1")
    }
    
    func depositAccount2() {
        print("depositAccount2")
        view?.upDateAccount2(value: "1")
    }
    
    func depositAccount3() {
        print("depositAccount3")
        view?.upDateAccount3(value: "1")
    }
    
    func depositAccount4() {
        print("depositAccount4")
        view?.upDateAccount4(value: "1")
    }
    
    func WithdrawAccount1() {
        print("WithdrawAccount1")
        view?.upDateAccount1(value: "0")
    }
    
    func WithdrawAccount2() {
        print("WithdrawAccount2")
        view?.upDateAccount2(value: "0")
    }
    
    func WithdrawAccount3() {
        print("WithdrawAccount3")
        view?.upDateAccount3(value: "0")
    }
    
    func WithdrawAccount4() {
        print("WithdrawAccount3")
        view?.upDateAccount4(value: "0")
    }
    
    
}
