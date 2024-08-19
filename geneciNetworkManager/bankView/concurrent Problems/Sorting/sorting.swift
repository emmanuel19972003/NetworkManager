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
        for _ in 0..<10_000 {
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
    
    func threadSort(list: [Int], nOfThread: Int) -> [Int] {
        let startInstant = clock.now
        let group = DispatchGroup()
        
        let splitArray = list.split(parts: nOfThread)
        var finalArray = [[Int]]()
        
        
        for array in splitArray {
            group.enter()
            DispatchQueue.global().async {
                print(Thread.current)
                finalArray.append(self.bubleSort(list: array))
                group.leave()
            }
        }
        group.wait()
        print("time use to sort:\(clock.now - startInstant)")
        return finalArray.unirYOrdenar()
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
            while i < array1.count {
                mergedArray.append(array1[i])
                i += 1
            }
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
    
    func split(parts: Int) -> [[Element]] {
        guard parts > 0 else { return [] }
        
        let totalElementos = self.count
        let elementosPorParte = totalElementos / parts
        let elementosSobrantes = totalElementos % parts
        
        var resultado = [[Element]]()
        var indiceActual = 0
        
        for i in 0..<parts {
            let inicio = indiceActual
            let fin = inicio + elementosPorParte + (i < elementosSobrantes ? 1 : 0)
            let parte = Array(self[inicio..<fin])
            resultado.append(parte)
            indiceActual = fin
        }
        
        return resultado
    }
}

extension Array where Element == [Int] {
    func unirYOrdenar() -> [Int] {
        var minHeap = [(element: Int, arrayIndex: Int, elementIndex: Int)]()
        var mergedArray = [Int]()

        // Inicializar el heap con el primer elemento de cada arreglo
        for (index, arreglo) in self.enumerated() {
            if !arreglo.isEmpty {
                minHeap.append((element: arreglo[0], arrayIndex: index, elementIndex: 0))
            }
        }
        
        // Convertir el array en un heap
        minHeap.sort { $0.element < $1.element }

        while !minHeap.isEmpty {
            // Obtener el elemento más pequeño del heap
            let minElement = minHeap.removeFirst()
            mergedArray.append(minElement.element)

            let nextElementIndex = minElement.elementIndex + 1
            if nextElementIndex < self[minElement.arrayIndex].count {
                // Insertar el siguiente elemento del arreglo de donde provino el elemento más pequeño
                let nextElement = self[minElement.arrayIndex][nextElementIndex]
                minHeap.append((element: nextElement, arrayIndex: minElement.arrayIndex, elementIndex: nextElementIndex))
                minHeap.sort { $0.element < $1.element }
            }
        }
        
        return mergedArray
    }
}
