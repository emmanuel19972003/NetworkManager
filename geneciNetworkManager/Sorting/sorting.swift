//
//  sorting.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 8/5/24.
//

import Foundation

class sorting {
    
    var list: [Int] = []
    
    var clock = ContinuousClock()
    
    func createList() -> [Int]{
        var list: [Int] = []
        for _ in 0..<5_000 {
            list.append(Int.random(in: -10_000...10_000))
        }
        return list
    }
    
    func checkList(list: [Int]) -> Bool{
        let listSize = list.count
        for i in 0...listSize - 2  {
            if list[i] > list[i + 1] {
                return false
            }
        }
        return true
    }
    
    func bubleSort(list: [Int]) -> [Int] {
        print(Thread.current)
        var sortedList = list
        var finalIndex = list.count - 2
        for _ in list {
            for i in 0...finalIndex {
                if sortedList[i] > sortedList [i + 1 ] {
                    let current = sortedList[i]
                    sortedList[i] = sortedList[i + 1]
                    sortedList[i + 1] = current
                }
            }
            finalIndex -= 1
            if finalIndex == 0 {
                if sortedList[0] > sortedList [1] {
                    let current = sortedList[0]
                    sortedList[0] = sortedList[1]
                    sortedList[1] = current
                }
                break
            }
        }
        return sortedList
    }
    
    func logger(testedFunc: ([Int]) -> [Int], list: [Int]) -> [Int]{
        let startInstant = clock.now
        let sorted = testedFunc(list)
        print("time use to sort:\(clock.now - startInstant)")
        return sorted
    }
    
    func threadSort(list: [Int]) -> [Int] {
        let group = DispatchGroup()
        
        var leftArray = list.split().left
        var rightArray = list.split().right
        
        group.enter()
        DispatchQueue.global().async {
            leftArray = self.bubleSort(list: leftArray)
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global().async {
            rightArray = self.bubleSort(list: rightArray)
            group.leave()
        }
        group.wait()
        let joined = joinArray(array1: leftArray, array2: rightArray)
        return joined
    }
    
    func joinArray(array1: [Int], array2: [Int]) -> [Int] {
        var mergedArray = [Int]()
            var i = 0
            var j = 0
            
            while i < array1.count && j < array2.count {
                if array1[i] < array2[j] {
                    mergedArray.append(array1[i])
                    i += 1
                } else {
                    mergedArray.append(array2[j])
                    j += 1
                }
            }
            
            // Añadir los elementos restantes de array1
            while i < array1.count {
                mergedArray.append(array1[i])
                i += 1
            }
            
            // Añadir los elementos restantes de array2
            while j < array2.count {
                mergedArray.append(array2[j])
                j += 1
            }
            
            return mergedArray
    }
}

extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}
