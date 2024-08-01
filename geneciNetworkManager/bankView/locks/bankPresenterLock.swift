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
    
    func depositAccount1() {
        print("deposit 1")
        view?.upDateAccount1(value: "5")
    }
    
    func WithdrawAccount1() {
        print("Withdraw 1")
        view?.upDateAccount1(value: "0")
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
        print("deposit 2")
        view?.upDateAccount2(value: "5")
    }
    
    func WithdrawAccount2() {
        print("Withdraw 2")
        view?.upDateAccount2(value: "0")
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
        print("deposit 3")
        view?.upDateAccount3(value: "5")
    }
    
    func WithdrawAccount3() {
        print("Withdraw 3")
        view?.upDateAccount3(value: "0")
    }
    
    func depositAccount4() {
        print("deposit 4")
        view?.upDateAccount4(value: "5")
    }
    
    func WithdrawAccount4() {
        print("Withdraw 4")
        view?.upDateAccount4(value: "0")
    }
    
    func setPresenter(view: bankView, type: typeOfConcurrency) {
        router?.setPresenter(view: view, type: type)
    }
    
    
}
