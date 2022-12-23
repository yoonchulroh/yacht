//
//  Structs.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import Foundation

class decision {
    var decisionID: Int
    var priority: Int
    
    func print() {
        Swift.print("decision \(self.decisionID) with priority \(self.priority)")
    }
    
    init(decisionID: Int, priority: Int) {
        self.decisionID = decisionID
        self.priority = priority
    }
}

struct strategyPriorityTable {
    var number: [[Int]]
    
    var straight: [Int]
    var choice6: [Int]
    var choice5: [Int]
    var choice4: [Int]
}

struct pickPriorityTable {
    var number: [[Int]]
    
    var yacht: Int
    var psuYacht: Int
    var largeStraight: Int
    var psuLargeStraight: Int
    var smallStraight: Int
    var psuSmallStraight: Int
    
    var choice25: Int
    var choice20: Int
    var choice15: Int
    var choice10: Int
    var choice5: Int
}
