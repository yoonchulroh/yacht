//
//  Legacy.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import Foundation

func createPopulation(playerNumber: Int) -> player {
    var strategyNumber = [[Int]]()
    var strategyNumberPart = [Int]()
    var straight = [Int]()
    var choice6 = [Int]()
    var choice5 = [Int]()
    var choice4 = [Int]()
    
    for i in 1 ... 6 {
        strategyNumberPart = []
        for j in 1 ... 6 {
            strategyNumberPart.append(Int.random(in: 0 ... 20))
        }
        strategyNumber.append(strategyNumberPart)
        straight.append(Int.random(in: 0 ... 20))
        choice6.append(Int.random(in: 0 ... 20))
        choice5.append(Int.random(in: 0 ... 20))
        choice4.append(Int.random(in: 0 ... 20))
    }
    var strategyPriority = strategyPriorityTable(number: strategyNumber, straight: straight, choice6: choice6, choice5: choice5, choice4: choice4)
    
    var pickNumber = [[Int]]()
    var pickNumberPart = [Int]()
    for i in 1 ... 6 {
        pickNumberPart = []
        for j in 1 ... 6 {
            pickNumberPart.append(Int.random(in: 0 ... 20))
        }
        pickNumber.append(pickNumberPart)
    }
    var pickPriority = pickPriorityTable(number: pickNumber, yacht: Int.random(in: 0 ... 20), psuYacht: Int.random(in: 0 ... 20), largeStraight: Int.random(in: 0 ... 20), psuLargeStraight: Int.random(in: 0 ... 20), smallStraight: Int.random(in: 0 ... 20), psuSmallStraight: Int.random(in: 0 ... 20), choice25: Int.random(in: 0 ... 20), choice20: Int.random(in: 0 ... 20), choice15: Int.random(in: 0 ... 20), choice10: Int.random(in: 0 ... 20), choice5: Int.random(in: 0 ... 20))
    
    return player(playerNumber: playerNumber, strategyPriority: strategyPriority, pickPriority: pickPriority)
}

func mutate(object: player) -> player {
    var newStrategyPriority: strategyPriorityTable = object.strategyPriority
    var newPickPriority: pickPriorityTable = object.pickPriority
    var newPlayer: player = object
    
    var mutateLocation: Int = 0
    var mutatedNumber: Int = 0
        
    var mutateCount = Int.random(in: 0 ... 5)
    for i in 0 ... mutateCount {
        mutateLocation = Int.random(in: 1 ... 60)
        newStrategyPriority = mutateStrategyPriority(mutateLocation: mutateLocation, strategyPriority: newStrategyPriority)
    }
    
    mutateCount = Int.random(in: 0 ... 5)
    for i in 0 ... mutateCount {
        mutateLocation = Int.random(in: 1 ... 47)
        newPickPriority = mutatePickPriority(mutateLocation: mutateLocation, pickPriority: newPickPriority)
    }
    
    newPlayer.strategyPriority = newStrategyPriority
    newPlayer.pickPriority = newPickPriority
    return newPlayer
}

func mutateStrategyPriority(mutateLocation: Int, strategyPriority: strategyPriorityTable) -> strategyPriorityTable {
    assert(mutateLocation <= 60)
    var newStrategyPriority: strategyPriorityTable = strategyPriority
    
    switch(mutateLocation) {
    case 1 ... 6 :
        newStrategyPriority.number[0][mutateLocation - 1] = Int.random(in: 0 ... 20)
    case 7 ... 12 :
        newStrategyPriority.number[1][mutateLocation - 7] = Int.random(in: 0 ... 20)
    case 13 ... 18 :
        newStrategyPriority.number[2][mutateLocation - 13] = Int.random(in: 0 ... 20)
    case 19 ... 24 :
        newStrategyPriority.number[3][mutateLocation - 19] = Int.random(in: 0 ... 20)
    case 25 ... 30 :
        newStrategyPriority.number[4][mutateLocation - 25] = Int.random(in: 0 ... 20)
    case 31 ... 36 :
        newStrategyPriority.number[5][mutateLocation - 31] = Int.random(in: 0 ... 20)
    case 37 ... 42:
        newStrategyPriority.straight[mutateLocation - 37] = Int.random(in: 0 ... 20)
    case 43 ... 48:
        newStrategyPriority.choice6[mutateLocation - 43] = Int.random(in: 0 ... 20)
    case 49 ... 54:
        newStrategyPriority.choice5[mutateLocation - 49] = Int.random(in: 0 ... 20)
    case 55 ... 60:
        newStrategyPriority.choice4[mutateLocation - 55] = Int.random(in: 0 ... 20)
    default:
        print("Error in mutation")
    }
    
    return newStrategyPriority
}

func mutatePickPriority(mutateLocation: Int, pickPriority: pickPriorityTable) -> pickPriorityTable {
    assert(mutateLocation <= 47)
    var newPickPriority: pickPriorityTable = pickPriority
    
    switch(mutateLocation) {
    case 1 ... 6 :
        newPickPriority.number[0][mutateLocation - 1] = Int.random(in: 0 ... 20)
    case 7 ... 12 :
        newPickPriority.number[1][mutateLocation - 7] = Int.random(in: 0 ... 20)
    case 13 ... 18 :
        newPickPriority.number[2][mutateLocation - 13] = Int.random(in: 0 ... 20)
    case 19 ... 24 :
        newPickPriority.number[3][mutateLocation - 19] = Int.random(in: 0 ... 20)
    case 25 ... 30 :
        newPickPriority.number[4][mutateLocation - 25] = Int.random(in: 0 ... 20)
    case 31 ... 36 :
        newPickPriority.number[5][mutateLocation - 31] = Int.random(in: 0 ... 20)
    case 37 :
        newPickPriority.largeStraight = Int.random(in: 0 ... 20)
    case 38 :
        newPickPriority.psuLargeStraight = Int.random(in: 0 ... 20)
    case 39 :
        newPickPriority.smallStraight = Int.random(in: 0 ... 20)
    case 40 :
        newPickPriority.psuSmallStraight = Int.random(in: 0 ... 20)
    case 41 :
        newPickPriority.yacht = Int.random(in: 0 ... 20)
    case 42 :
        newPickPriority.psuYacht = Int.random(in: 0 ... 20)
    case 43 :
        newPickPriority.choice25 = Int.random(in: 0 ... 20)
    case 44 :
        newPickPriority.choice20 = Int.random(in: 0 ... 20)
    case 45 :
        newPickPriority.choice15 = Int.random(in: 0 ... 20)
    case 46 :
        newPickPriority.choice10 = Int.random(in: 0 ... 20)
    case 47 :
        newPickPriority.choice5 = Int.random(in: 0 ... 20)
    default:
        print("Error in mutation")
    }
    
    return newPickPriority
}
