//
//  BankGDC.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 25/07/24.
//

import Foundation

class BankGDC {
    var balance: Int
    
    var queue: DispatchQueue?
    
    init(balance: Int, queue: DispatchQueue? = nil) {
        self.balance = balance
        self.queue = queue
    }
    
    func deposit(amount: Int) {
        balance += amount
    }
    @discardableResult
    func withdraw(amount: Int) -> Bool {
        if balance >= amount {
            Thread.sleep(forTimeInterval: 2.0)
            self.balance -= amount
            print("withdraw balance: \(balance)")
            return true
        } else {
            return false
        }
    }
    
    func getBalance() -> Int {
        return balance
    }
    
    func depositOnQueue(amount: Int) {
        queue?.async {
            self.balance += amount
        }
    }
    
    func withdrawOnQueue(amount: Int) {
        queue?.async {
            if self.balance >= amount {
                Thread.sleep(forTimeInterval: 2.0)
                self.balance -= amount
                print("withdraw balance: \(self.balance)")
            } else {
                print("no founds")
            }
        }
    }
    
    func getBalanceOnQueue() -> Int {// ????
        queue?.sync {
            return balance
        }
        return 0
    }
    
}
