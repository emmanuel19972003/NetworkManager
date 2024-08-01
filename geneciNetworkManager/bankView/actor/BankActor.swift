//
//  BankActor.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 24/07/24.
//

import Foundation

actor BankActor {
    
    init(balance: Int) {
        self.balance = balance
    }
    
    private var balance: Int
    
    func deposit(amount: Int) {
        balance += amount
    }
    @discardableResult
    func withdraw(amount: Int) -> Bool {
        if balance >= amount {
            print("hay plata, antes del sleep")
            Thread.sleep(forTimeInterval: 2)
            balance -= amount
            print("withdraw balance 1: \(balance)")
            return true
        } else {
            return false
        }
    }
    
    func getBalance() -> Int {
        return balance
    }
}

actor TransactionManager {
    let account: BankActor
    
    init(account: BankActor) {
        self.account = account
    }
    
    @discardableResult
    func performWithdrawal(amount: Int) async -> Bool{
        return await account.withdraw(amount: amount)
    }
    
    func performDeposit(amount: Int) async {
        await account.deposit(amount: amount)
    }
    
    func getBalance() async -> Int {
        return await account.getBalance()
    }
}

