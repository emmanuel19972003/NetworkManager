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
    
    var account1 = BankActor(balance: 5)
    
    var manager1 = TransactionManager(account: BankActor(balance: 10))
    
    var account2 = BankActor(balance: 0)
    
    func depositAccount1() {
        Task {
            await manager1.performDeposit(amount: 10)
            let balance = await manager1.getBalance()
            DispatchQueue.main.async  {
                self.view?.upDateAccount1(value: "\(balance)")
            }
        }
    }
    
    func WithdrawAccount1() {
        Task {
//            await manager1.performWithdrawal(amount:10)
//            let balance = await manager1.getBalance()
//            let queue = DispatchQueue.main
//            queue.async  {
//                self.view?.upDateAccount1(value: "\(balance)")
//            }
            await asyncWithdrawAccount1()
        }
    }
    
    private func asyncWithdrawAccount1() async {
        await manager1.performWithdrawal(amount:10)
        let balance = await manager1.getBalance()
        let queue = DispatchQueue.main
        queue.async  {
            self.view?.upDateAccount1(value: "\(balance)")
        }
    }
    
    func MultipleAcction1() {
        Task {
            await manager1.performWithdrawal(amount:10)
            let balance = await manager1.getBalance()
            let queue = DispatchQueue.main
            queue.async  {
                self.view?.upDateAccount1(value: "\(balance)")
            }
            
        }
        
        Task {
            await manager1.performWithdrawal(amount:10)
            let balance = await manager1.getBalance()
            let queue = DispatchQueue.main
            queue.async  {
                self.view?.upDateAccount1(value: "\(balance)")
            }
            
        }
    }
    
    func depositAccount2() {
        Task {
            await account2.deposit(amount: 10)
            let balance = await account2.getBalance()
            let queue = DispatchQueue.main
            queue.async  {
                self.view?.upDateAccount2(value: "\(balance)")
            }
        }
    }
    
    func WithdrawAccount2() {
        Task {
            await account2.withdraw(amount: 7)
            let balance = await account2.getBalance()
            let queue = DispatchQueue.main
            queue.async  {
                self.view?.upDateAccount2(value: "\(balance)")
            }
        }
    }
    
    func MultipleAcction2() {
        let account = Account()
        let manager = TransactionManagerTest(account: account)
        
        // Perform a withdrawal from TransactionManager Actor
        Task {
            // cross-actor reference
            await manager.performWithdrawal(amount: 10)
            let balance = await account.balance
            DispatchQueue.main.async  {
                self.view?.upDateAccount2(value: "\(balance)")
            }
        }
        
        // Perform a withdrawal from outside any actor
        Task {
            // cross-actor reference
            await account.withdraw(amount: 10)
            
            let balance = await account.balance
            DispatchQueue.main.async  {
                self.view?.upDateAccount2(value: "\(balance)")
            }
        }
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
    
    
}

