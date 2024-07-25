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
    
    let account1 = BankGDC(balance: 0)
    
    let queue1 = DispatchQueue(label: "account1", attributes: [], autoreleaseFrequency: .never, target: nil)
    let queue2 = DispatchQueue(label: "account2", qos: .utility, attributes: [], autoreleaseFrequency: .never, target: nil)
    
    func depositAccount1()  {
        account1.deposit(amount: 10)
        let balance = account1.getBalance()
        view?.upDateAccount1(value: "\(balance)")
    }
    
    func WithdrawAccount1() {
        queue1.async {
            self.account1.withdraw(amount: 5)
            DispatchQueue.main.async {
                let balance = self.account1.getBalance()
                self.view?.upDateAccount1(value: "\(balance)")
            }
        }
    }
    
    func MultipleAcction1() {
        queue1.async {
            self.account1.deposit(amount: 10)
            let balance = self.account1.getBalance()
            DispatchQueue.main.async {
                self.view?.upDateAccount1(value: "\(balance)")
            }
        }
    }
    
    func depositAccount2() {
        print("depositAccount2")
        view?.upDateAccount2(value: "1")
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
