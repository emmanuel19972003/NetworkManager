//
//  bankPresenter.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 23/07/24.
//

import Foundation

final class bankPresenterActor: bankPresenterProtocol {
    
    weak var view: bankViewProtocol?
    
    var router: bankRouterProtocol?
    
    var account1 = BankActor(balance: 0)
    
    func depositAccount1() async {
        await account1.deposit(amount: 10)
        let balance = await account1.getBalance()
        let queue = DispatchQueue.main
        queue.async  { 
            self.view?.upDateAccount1(value: "\(balance)")
        }
    }
    
    func WithdrawAccount1() async {
        await account1.withdraw(amount: 7)
        let balance = await account1.getBalance()
        let queue = DispatchQueue.main
        queue.async  {
            self.view?.upDateAccount1(value: "\(balance)")
        }
    }
    
    func depositAccount2() async {
        print("depositAccount2")
        view?.upDateAccount2(value: "5")
    }
    
    func WithdrawAccount2() async {
        await account1.withdraw(amount: 7)
        let balance = await account1.getBalance()
        let queue = DispatchQueue.main
        queue.async  {
            self.view?.upDateAccount1(value: "\(balance)")
        }
    }
    
    func depositAccount3() async {
        print("depositAccount3")
        view?.upDateAccount3(value: "5")
    }
    
    func depositAccount4() async {
        print("depositAccount4")
        view?.upDateAccount4(value: "5")
    }
    
    func WithdrawAccount3() async {
        print("WithdrawAccount3")
        view?.upDateAccount3(value: "3")
    }
    
    func WithdrawAccount4() async {
        print("WithdrawAccount3")
        view?.upDateAccount4(value: "3")
    }
    
    
}

