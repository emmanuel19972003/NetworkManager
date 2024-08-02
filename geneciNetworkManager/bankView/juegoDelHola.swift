//
//  juegoDelHola.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 2/08/24.
//

import Foundation


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
