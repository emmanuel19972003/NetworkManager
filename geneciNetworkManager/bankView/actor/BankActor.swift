//
//  BankActor.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 24/07/24.
//

import Foundation

actor BankAccountActor {
    
    init(balance: Int) {
        self.balance = balance
    }
    
    private var balance: Int
    
    func deposit(amount: Int) {
        balance += amount
    }
    @discardableResult
    func withdraw(amount: Int) async -> Bool {
        if balance >= amount {
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000) // 2 seconds
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
