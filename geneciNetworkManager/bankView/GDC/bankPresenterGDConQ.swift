//
//  bankPresenterGDConQ.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 25/07/24.
//

import Foundation

import Foundation

final class bankPresenterGDConQ: bankPresenterProtocol {
    
    init(view: bankViewProtocol? = nil, router: bankRouterProtocol? = nil) {
        self.view = view
        self.router = router
        setQueues()
    }
    
    func setQueues() {
        account1.queue = queue1
        account2.queue = queue1
        account3.queue = queue1
        account4.queue = queue1
    }
    
    weak var view: bankViewProtocol?
    
    var router: bankRouterProtocol?
    
    let account1 = BankGDC(balance: 0)
    let account2 = BankGDC(balance: 0)
    let account3 = BankGDC(balance: 0)
    let account4 = BankGDC(balance: 0)
    

    let queue1 = DispatchQueue(label: "account1", qos: .userInteractive, attributes: [], autoreleaseFrequency: .never, target: nil)
    let queue2 = DispatchQueue(label: "account2", qos: .userInteractive, attributes: [], autoreleaseFrequency: .never, target: nil)
    let queue3 = DispatchQueue(label: "account3", qos: .userInteractive, attributes: [], autoreleaseFrequency: .never, target: nil)
    let queue4 = DispatchQueue(label: "account4", qos: .userInteractive, attributes: [], autoreleaseFrequency: .never, target: nil)
    
    func depositAccount1()  {
        account1.depositOnQueue(amount: 10)
        let balance = account1.getBalanceOnQueue()
        view?.upDateAccount1(value: "\(balance)")
    }
    
    func WithdrawAccount1() {
        account1.withdrawOnQueue(amount: 5)
        let balance = account1.getBalanceOnQueue()
        view?.upDateAccount1(value: "\(balance)")
    }
    
    func MultipleAcction1() {
        let balance = account1.getBalance()
        view?.upDateAccount1(value: "\(balance)")
    }
    
    func depositAccount2() {
        account2.depositOnQueue(amount: 10)
        let balance = account2.getBalanceOnQueue()
        queue2.async {
            self.view?.upDateAccount2(value: "\(balance)")
        }
        
    }
    
    func WithdrawAccount2() {
        account2.withdrawOnQueue(amount: 5)
        let balance = account2.getBalanceOnQueue()
        queue2.async {
            self.view?.upDateAccount2(value: "\(balance)")
        }
    }
    
    func MultipleAcction2() {
        print("miltiple 1")
        view?.upDateAccount2(value: "15")
    }
    
    func depositAccount3() {
        print("depositAccount3")
        view?.upDateAccount3(value: "1")
    }
    
    func depositAccount4() {
        print("depositAccount4")
        view?.upDateAccount4(value: "1")
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
