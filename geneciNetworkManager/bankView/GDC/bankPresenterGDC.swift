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
    let account2 = BankGDC(balance: 0)
    let account3 = BankGDC(balance: 0)
    let account4 = BankGDC(balance: 0)
    
    let queue1 = DispatchQueue(label: "account1", qos: .userInteractive, attributes: [], autoreleaseFrequency: .never, target: nil)
    let queue2 = DispatchQueue(label: "account2", qos: .userInitiated, attributes: [], autoreleaseFrequency: .never, target: nil)
    let queue3 = DispatchQueue(label: "account3", qos: .userInteractive, attributes: [], autoreleaseFrequency: .never, target: nil)
    let queue4 = DispatchQueue(label: "account4 concurrent", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .never, target: nil)
    
    func depositAccount1()  {
        queue1.async {
            self.account1.deposit(amount: 10)
            let balance = self.account1.getBalance()
            DispatchQueue.main.async {
                self.view?.upDateAccount1(value: "\(balance)")
            }
        }
        
    }
    
    func WithdrawAccount1() {
        queue1.async {
            self.account1.withdraw(amount: 5)
            print("thread withDraw: \(Thread.current)")
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
            print("thread Multiple: \(Thread.current)")
            DispatchQueue.main.async {
                self.view?.upDateAccount1(value: "\(balance)")
            }
        }
    }
    
    func depositAccount2() {
        queue2.async {
            self.account2.deposit(amount: 10)
            let balance = self.account2.getBalance()
            DispatchQueue.main.async {
                self.view?.upDateAccount2(value: "\(balance)")
            }
        }
    }
    
    func WithdrawAccount2() {
        queue2.async {
            self.account2.withdraw(amount: 5)
            DispatchQueue.main.async {
                let balance = self.account2.getBalance()
                self.view?.upDateAccount2(value: "\(balance)")
            }
        }
    }
    func MultipleAcction2() async {
        print("miltiple 1")
        view?.upDateAccount2(value: "15")
    }
    
    func depositAccount3() {
        queue3.async {
            self.account3.deposit(amount: 10)
            let balance = self.account3.getBalance()
            DispatchQueue.main.async {
                self.view?.upDateAccount3(value: "\(balance)")
            }
        }
    }
    
    func WithdrawAccount3() {
        queue3.async {
            print("in one")
            self.account3.withdraw(amount: 5)
            let balance = self.account3.getBalance()
            self.view?.upDateAccount3(value: "\(balance)")
            print("finis one")
        }
        queue3.async {
            print("in two")
            self.account3.withdraw(amount: 5)
            let balance = self.account3.getBalance()
            self.view?.upDateAccount3(value: "\(balance)")
            print("finish two")
        }
        queue3.async {
            print("in three")
            Thread.sleep(forTimeInterval: 2)
            print("finish three")
        }
    }
    
    func depositAccount4() {
        queue4.async {
            self.account4.deposit(amount: 10)
            let balance = self.account4.getBalance()
            DispatchQueue.main.async {
                self.view?.upDateAccount4(value: "\(balance)")
            }
        }
    }
    
    func WithdrawAccount4() {
        var elValor = ""
        queue4.async {
            print("en el primer async")
            self.account4.withdraw(amount: 5)
            let balance = self.account4.getBalance()
            self.view?.upDateAccount4(value: "\(balance)")
            elValor += "termino uno "
            print(elValor)
        }
        queue4.async {
            print("en el segundo async")
            self.account4.withdraw(amount: 5)
            let balance = self.account4.getBalance()
            self.view?.upDateAccount4(value: "\(balance)")
            elValor += "termino dos "
            print(elValor)
        }
        queue4.sync {
            print("el cose es")
            elValor += "termino todo "
            Thread.sleep(forTimeInterval: 2)
            print(elValor)
        }
    }
    
    func setPresenter(view: bankView, type: typeOfConcurrency) {
        router?.setPresenter(view: view, type: type)
    }
    
}
