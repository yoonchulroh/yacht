//
//  Generate.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import Foundation

func generateStrategies(strategyPriority: strategyPriorityTable, playerNumber: Int, dices: [Int]) -> [decision] {
    var count: [Int] = [0,0,0,0,0,0]
    var strategy = [decision]()
    var exist: [Bool] = [false,false,false,false,false,false]
    var straight1: Int = 0
    var straight2: Int = 0
    var count6: Int = 0
    var count5: Int = 0
    var count4: Int = 0
    
    for i in 0 ... dices.count - 1 {
        count[dices[i] - 1] += 1
        if exist[dices[i] - 1] == false {
            exist[dices[i] - 1] = true
        }
    }
    
    for i in 0 ... 4 {
        if exist[i] == true {
            straight1 += 1
        }
    }
    
    for i in 1 ... 5 {
        if exist[i] == true {
            straight2 += 1
        }
    }
    
    for i in 0 ... dices.count - 1 {
        switch(dices[i]) {
        case 4:
            count4 += 1
            break
        case 5:
            count4 += 1
            count5 += 1
            break
        case 6:
            count4 += 1
            count5 += 1
            count6 += 1
            break
        default:
            break
        }
    }
    
    for i in 0 ... count.count - 1 {
        if playerList[playerNumber].numberAvailable[i] || playerList[playerNumber].yachtAvailable {
            strategy.append(decision(decisionID: i + 11, priority: strategyPriority.number[i][count[i]]))
        }
    }
    
    if playerList[playerNumber].smallStraightAvailable || playerList[playerNumber].largeStraightAvailable {
        strategy.append(decision(decisionID: 21, priority: strategyPriority.straight[straight1]))
        strategy.append(decision(decisionID: 22, priority: strategyPriority.straight[straight2]))
    }
    
    if playerList[playerNumber].choiceAvailable {
        strategy.append(decision(decisionID: 36, priority: strategyPriority.choice6[count6]))
        strategy.append(decision(decisionID: 35, priority: strategyPriority.choice5[count5]))
        strategy.append(decision(decisionID: 34, priority: strategyPriority.choice4[count4]))
    }
    
    return strategy
}

func generatePicks(pickPriority: pickPriorityTable, playerNumber: Int, dices: [Int]) -> [decision] {
    var count: [Int] = [0,0,0,0,0,0]
    var pick = [decision]()
    var choice: Int = 0
    
    for i in 0 ... dices.count - 1 {
        count[dices[i] - 1] += 1
        choice += dices[i]
    }
    
    for i in 0 ... count.count - 1 {
        if playerList[playerNumber].yachtAvailable && count[i] == 5 {
            pick.append(decision(decisionID: 40, priority: pickPriority.yacht))
        }
        if playerList[playerNumber].numberAvailable[i] {
            //print(pickPriority.number[i][count[i]])
            pick.append(decision(decisionID: 11 + i, priority: pickPriority.number[i][count[i]]))
        }
    }
    
    if playerList[playerNumber].largeStraightAvailable {
        if count == [1,1,1,1,1,0] {
            pick.append(decision(decisionID: 24, priority: pickPriority.largeStraight))
        }
        if count == [0,1,1,1,1,1] {
            pick.append(decision(decisionID: 25, priority: pickPriority.largeStraight))
        }
    }
    
    if playerList[playerNumber].smallStraightAvailable {
        if count[0...3] == [1,1,1,1] {
            pick.append(decision(decisionID: 21, priority: pickPriority.smallStraight))
        }
        if count[1...4] == [1,1,1,1] {
            pick.append(decision(decisionID: 22, priority: pickPriority.smallStraight))
        }
        if count[2...5] == [1,1,1,1] {
            pick.append(decision(decisionID: 23, priority: pickPriority.smallStraight))
        }
    }
    
    if playerList[playerNumber].choiceAvailable {
        switch(choice) {
        case 25...30 :
            pick.append(decision(decisionID: 30, priority: pickPriority.choice25))
        case 20...24 :
            pick.append(decision(decisionID: 30, priority: pickPriority.choice20))
        case 15...19 :
            pick.append(decision(decisionID: 30, priority: pickPriority.choice15))
        case 10...14 :
            pick.append(decision(decisionID: 30, priority: pickPriority.choice10))
        case 5...9 :
            pick.append(decision(decisionID: 30, priority: pickPriority.choice5))
        default:
            print("Error in choice")
        }
    }
    
    if playerList[playerNumber].yachtAvailable {
        pick.append(decision(decisionID: 40, priority: pickPriority.psuYacht))
    }
    if playerList[playerNumber].largeStraightAvailable {
        pick.append(decision(decisionID: 24, priority: pickPriority.psuLargeStraight))
    }
    if playerList[playerNumber].smallStraightAvailable {
        pick.append(decision(decisionID: 21, priority: pickPriority.psuSmallStraight))
    }
    
    return pick
}
