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
    
    var account2 = BankActor(balance: 0)
    
    
    
    func depositAccount1() {
        Task {
            await account1.deposit(amount: 10)
            let balance = await account1.getBalance()
            self.view?.upDateAccount1(value: "\(balance)")
        }
    }
    
    func WithdrawAccount1() {
        Task {
            await account1.withdraw(amount:5)
            let balance = await account1.getBalance()
            self.view?.upDateAccount1(value: "\(balance)")
        }
    }
    
    func MultipleAcction1() {
        let accountManager = TransactionManager(account: account1)
        
        Task {
            await accountManager.performWithdrawal(amount: 5)
            let balance = await accountManager.getBalance()
            self.view?.upDateAccount1(value: "\(balance)")
        }
        Task {
            await account1.withdraw(amount: 5)
            let balance = await account1.getBalance()
            self.view?.upDateAccount1(value: "\(balance)")
        }
        
    }
    
    func depositAccount2() {
        Task {
            await account2.deposit(amount: 10)
            let balance = await account2.getBalance()
            self.view?.upDateAccount2(value: "\(balance)")
        }
    }
    
    func WithdrawAccount2() {
        Task {
            await account2.withdraw(amount: 5)
            let balance = await account2.getBalance()
            self.view?.upDateAccount2(value: "\(balance)")
        }
    }
    
    func MultipleAcction2() async {
        
        
    }
    
    func depositAccount3() {
        print("depositAccount3")
        view?.upDateAccount3(value: "5")
    }
    
    func depositAccount4() {
        print("depositAccount4")
        view?.upDateAccount4(value: "5")
    }
    
    func WithdrawAccount3() {
        print("WithdrawAccount3")
        view?.upDateAccount3(value: "3")
    }
    
    func WithdrawAccount4() {
        print("WithdrawAccount3")
        view?.upDateAccount4(value: "3")
    }
    
    func setPresenter(view: bankView, type: typeOfConcurrency) {
        router?.setPresenter(view: view, type: type)
    }
}

