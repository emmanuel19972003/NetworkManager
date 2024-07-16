//
//  queues.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 12/07/24.
//

import Foundation

class Cosas {
    func dispatch_Group() {
        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .background)

        for i in 0..<3 {
            group.enter()
            queue.async {
                print("Dispatch Group Task \(i)")
                group.leave()
            }
        }

        group.notify(queue: DispatchQueue.main) {
            print("All tasks are done")
        }

        print("Main thread")
    }
}


class SimpleOperation: Operation {
    override func main() {
        if isCancelled {
            return
        }
        
        // Simulate a task
        print("Operation started")
        Thread.sleep(forTimeInterval: 2)
        print("Operation finished")
    }
}

class DependentOperation: Operation {
    let operationName: String
    
    init(name: String) {
        self.operationName = name
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        // Simulate a task
        print("\(operationName) started")
        Thread.sleep(forTimeInterval: 2)
        print("\(operationName) finished")
    }
}

class usoOperationQueue {
    func operation() {
        let operationQueue = OperationQueue()

        let operation1 = SimpleOperation()
        let operation2 = SimpleOperation()
        
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)

        print("Main thread continues execution")
    }
    func dependencia() {
        let operationQueue = OperationQueue()

        let operation1 = DependentOperation(name: "Operation 1")
        let operation2 = DependentOperation(name: "Operation 2")

        operation2.addDependency(operation1)

        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)

        print("Main thread continues execution")
    }
    
    func dads() {
        var sets = Set<Int?>()
        var input: String = "dasd3423gds"
        for letter in input {
            let sfas = Int("\(letter)")
            sets.insert(sfas)
        }
        
    }
}
