//
//  primeProblem.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 8/16/24.
//

import Foundation

class primeProblem {
    var current = 0
    let lock = NSLock()
    let listOfNumbers: [Int]
    init(listOfNumbers: [Int]) {
        self.listOfNumbers = listOfNumbers
    }
    
    func checkForPrims() {
        let group = DispatchGroup()
        var finalsList: [Bool?] = Array(repeating: nil, count: listOfNumbers.count)
        while self.current < self.listOfNumbers.count {
            group.enter()
            DispatchQueue.global().async {
                let myCurrent = self.getItem()
                self.lock.unlock()
                if myCurrent != -1 {
                    print("el hilo es \(Thread.current), y el numero es: \(myCurrent)")
                    let isPrime = self.checkForPrime(number: self.listOfNumbers[myCurrent])
                    finalsList[myCurrent] = isPrime
                    Thread.sleep(forTimeInterval: 1)
                    
                }
                group.leave()
            }
        }
        group.wait()
        print(finalsList)
    }
    
    func getItem() -> Int {
        lock.lock()
        if current == listOfNumbers.count {
            return -1
        }
        let current  = current
        self.current += 1
        return current
    }
    func checkForPrime(number: Int) -> Bool {
        if number == 1 || number == 2 {
            return true
        }
        for i in 2..<number {
            if number%i == 0 {
                return false
            }
        }
        return true
    }
}
