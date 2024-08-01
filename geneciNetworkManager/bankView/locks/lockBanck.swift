//
//  lockBanck.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 1/08/24.
//

import Foundation

class lockBanck {
    
    var balance: Int
    
    init(balance: Int) {
        self.balance = balance
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
}

actor juegoDelHola {
    var myString = ""
    
    var steps:[String] = []
    
    func addLetter(_ letter: Character) {
        Thread.sleep(forTimeInterval: TimeInterval(Int.random(in: 0...2)))
        myString += "\(letter)"
        steps.append(myString)
    }
}

class juegoDelHolaClass {
    var myString = ""
    
    var steps:[String] = []
    
    func addLetter(_ letter: Character) {
        Thread.sleep(forTimeInterval: TimeInterval(Int.random(in: 0...2)))
        myString += "\(letter)"
        steps.append(myString)
    }
}
