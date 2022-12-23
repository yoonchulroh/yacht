//
//  Player.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import Foundation

class player {
    var playerNumber: Int = 0
    var strategyPriority: strategyPriorityTable
    var pickPriority: pickPriorityTable
    
    var numberAvailable: [Bool] = [true,true,true,true,true,true]
    var yachtAvailable: Bool = true
    var smallStraightAvailable: Bool = true
    var largeStraightAvailable: Bool = true
    var choiceAvailable: Bool = true
    var currentScore: Int = 0
    
    var numberScore: [Int] = [0,0,0,0,0,0]
    var yachtScore: Int = 0
    var smallStraightScore: Int = 0
    var largeStraightScore: Int = 0
    var choiceScore: Int = 0
    var bonusScore: Int = 0
    
    var strategyList: [decision] = []
    var pickList: [decision] = []
    var rolledDices: [Int] = [0,0,0,0,0]
    var strategySelected: Int = 0
    var pickSelected: Int = 0
    
    func playTurn() {
        self.rolledDices = [0,0,0,0,0]
        self.rolledDices = roll(playerNumber: self.playerNumber, dices: self.rolledDices)
        
        self.strategyList = generateStrategies(strategyPriority: self.strategyPriority, playerNumber: self.playerNumber, dices: self.rolledDices)
        if self.strategyList.count == 0 {
            gameEnded = true
        }
        self.strategyList = chooseHighest(object: self.strategyList)
        for item in strategyList {
            //item.print()
        }
        self.strategySelected = Int.random(in: 0 ..< self.strategyList.count)
        conductStrategy(playerNumber: self.playerNumber, strategy: self.strategyList[self.strategySelected].decisionID, dices: self.rolledDices)
        
        self.strategyList = generateStrategies(strategyPriority: self.strategyPriority, playerNumber: self.playerNumber, dices: self.rolledDices)
        self.strategyList = chooseHighest(object: self.strategyList)
        for item in strategyList {
            //item.print()
        }
        self.strategySelected = Int.random(in: 0 ..< self.strategyList.count)
        conductStrategy(playerNumber: self.playerNumber, strategy: self.strategyList[self.strategySelected].decisionID, dices: self.rolledDices)
        
        self.pickList = generatePicks(pickPriority: self.pickPriority, playerNumber: self.playerNumber, dices: self.rolledDices)
        self.pickList = chooseHighest(object: self.pickList)
        for item in strategyList {
            //item.print()
        }
        self.pickSelected = Int.random(in: 0 ..< self.pickList.count)
        conductPick(playerNumber: self.playerNumber, pick: self.pickList[self.pickSelected].decisionID, dices: self.rolledDices)
    }
    
    func calculateScore() {
        for i in 0 ... self.numberScore.count - 1 {
            self.currentScore += self.numberScore[i]
        }
        if self.currentScore >= 63 {
            self.bonusScore = 35
            self.currentScore += self.bonusScore
        }
        self.currentScore += self.yachtScore
        self.currentScore += self.smallStraightScore
        self.currentScore += self.largeStraightScore
        self.currentScore += self.choiceScore
    }
    
    func printTable() {
        print("Player " + String(self.playerNumber) + "'s score is " + String(self.currentScore))
        print("Number 1 Score: \(self.numberScore[0])")
        print("Number 2 Score: \(self.numberScore[1])")
        print("Number 3 Score: \(self.numberScore[2])")
        print("Number 4 Score: \(self.numberScore[3])")
        print("Number 5 Score: \(self.numberScore[4])")
        print("Number 6 Score: \(self.numberScore[5])")
        print("Bonus Score: \(self.bonusScore)")
        
        print("Small Straight Score: \(self.smallStraightScore)")
        print("Large Straight Score: \(self.largeStraightScore)")
        print("Choice Score: \(self.choiceScore)")
        print("Yacht Score: \(self.yachtScore)")
        print("")
    }
    
    init(playerNumber: Int, strategyPriority: strategyPriorityTable, pickPriority: pickPriorityTable) {
        self.playerNumber = playerNumber
        self.strategyPriority = strategyPriority
        self.pickPriority = pickPriority
    }
}
