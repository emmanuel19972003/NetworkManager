//
//  bankPresenterLock.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 1/08/24.
//

import Foundation

class bankPresenterLock: bankPresenterProtocol {
    var view: bankViewProtocol?
    
    var router: bankRouterProtocol?
    
    let juego = juegoDelHola()
    
    let account1 = lockBanck(balance: 0)
    let account2 = lockBanck(balance: 0)
    let account3 = lockBanck(balance: 0)
    let account4 = lockBanck(balance: 0)
    
    func depositAccount1() {
        DispatchQueue.global().async {
            self.account1.deposit(amount: 10)
            let value = self.account1.getBalance()
            self.view?.upDateAccount1(value: "\(value)")
        }
       
    }
    
    func WithdrawAccount1() {
        DispatchQueue.global().async {
            self.account1.withdraw(amount: 5)
            let value = self.account1.getBalance()
            self.view?.upDateAccount1(value: "\(value)")
        }
    }
    
    func MultipleAcction1() {
        for i in "Hola mundo" {
            Task {
                await juego.addLetter(i)
                await print(juego.myString)
            }
            print("final del for")
        }
        
    }
    
    func depositAccount2() {
        DispatchQueue.global().async {
            self.account2.deposit(amount: 10)
            let value = self.account2.getBalance()
            self.view?.upDateAccount2(value: "\(value)")
        }
    }
    
    func WithdrawAccount2() {
        DispatchQueue.global().async {
            self.account2.withdraw(amount: 5)
            let value = self.account2.getBalance()
            self.view?.upDateAccount2(value: "\(value)")
        }
    }
    
    func MultipleAcction2() async {
        print("miltiple 2")
        view?.upDateAccount2(value: "3")
        Task {
            for i in "Hola mundo" {
                
                await juego.addLetter(i)
                await print(juego.myString)
            }
        }
    }
    
    func depositAccount3() {
        DispatchQueue.global().async {
            self.account3.deposit(amount: 10)
            let value = self.account3.getBalance()
            self.view?.upDateAccount3(value: "\(value)")
        }
    }
    
    func WithdrawAccount3() {
        DispatchQueue.global().async {
            self.account3.withdraw(amount: 5)
            let value = self.account3.getBalance()
            self.view?.upDateAccount3(value: "\(value)")
        }
    }
    
    func depositAccount4() {
        DispatchQueue.global().async {
            self.account4.deposit(amount: 10)
            let value = self.account4.getBalance()
            self.view?.upDateAccount4(value: "\(value)")
        }
    }
    
    func WithdrawAccount4() {
        DispatchQueue.global().async {
            self.account4.withdraw(amount: 5)
            let value = self.account4.getBalance()
            self.view?.upDateAccount4(value: "\(value)")
        }
    }
    
    func setPresenter(view: bankView, type: typeOfConcurrency) {
        router?.setPresenter(view: view, type: type)
    }
    
    
}
