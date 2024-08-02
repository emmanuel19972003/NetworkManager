//
//  lockBanck.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 1/08/24.
//

import Foundation

class lockBanck {
    
    var balance: Int
    let lock = NSLock()
    
    init(balance: Int) {
        self.balance = balance
    }
    
    func deposit(amount: Int) {
        balance += amount
    }
    @discardableResult
    func withdraw(amount: Int) -> Bool {
        lock.lock()
        if balance >= amount {
            Thread.sleep(forTimeInterval: 2.0)
            self.balance -= amount
            print("withdraw balance: \(balance)")
            lock.unlock()
            return true
        } else {
            lock.unlock()
            return false
        }
    }
    
    func getBalance() -> Int {
        return balance
    }
}
