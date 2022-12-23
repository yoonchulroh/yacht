//
//  Evolutions.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import Foundation

func createDNA() -> [Int] {
    var newDNA = [Int]()
    for i in 1 ... 107 {
        newDNA.append(Int.random(in: 0 ... 20))
    }
    return newDNA
}

func DNAtoPlayer(playerNumber: Int, DNA: [Int]) -> player {
    var strategyNumber = [[Int]]()
    for i in 0 ... 5 {
        strategyNumber.append(Array(DNA[(6*i)...(6*i + 5)]))
    }
    var strategyStraight: [Int] = Array(DNA[(36)...(41)])
    var strategyChoice6: [Int] = Array(DNA[(42)...(47)])
    var strategyChoice5: [Int] = Array(DNA[(48)...(53)])
    var strategyChoice4: [Int] = Array(DNA[(54)...(59)])
    
    var pickNumber = [[Int]]()
    for i in 10 ... 15 {
        pickNumber.append(Array(DNA[(6*i)...(6*i + 5)]))
    }
    var pickChoice25: Int = DNA[96]
    var pickChoice20: Int = DNA[97]
    var pickChoice15: Int = DNA[98]
    var pickChoice10: Int = DNA[99]
    var pickChoice5: Int = DNA[100]
    var pickYacht: Int = DNA[101]
    var pickPsuYacht: Int = DNA[102]
    var pickLargeStraight: Int = DNA[103]
    var pickPsuLargeStraight: Int = DNA[104]
    var pickSmallStraight: Int = DNA[105]
    var pickPsuSmallStraight: Int = DNA[106]
    
    var strategyPriority = strategyPriorityTable(number: strategyNumber, straight: strategyStraight, choice6: strategyChoice6, choice5: strategyChoice5, choice4: strategyChoice4)
    var pickPriority = pickPriorityTable(number: pickNumber, yacht: pickYacht, psuYacht: pickPsuYacht, largeStraight: pickLargeStraight, psuLargeStraight: pickPsuLargeStraight, smallStraight: pickSmallStraight, psuSmallStraight: pickPsuSmallStraight, choice25: pickChoice25, choice20: pickChoice20, choice15: pickChoice15, choice10: pickChoice10, choice5: pickChoice5)
    
    return player(playerNumber: playerNumber, strategyPriority: strategyPriority, pickPriority: pickPriority)
}

func evaluate(populationList: [player]) -> [[Int]] {
    assert(populationList.count % 3 == 0)
    var populationListCopy: [player] = populationList
    var newPopulation = [player]()
    for item in populationListCopy {
        for i in 1 ... 10 {
            item.playTurn()
        }
        item.calculateScore()
    }
    var population = [[Int]]()
    var returnPopulation = [[Int]]()
    for i in 0 ... populationListCopy.count - 1 {
        population.append([i, populationListCopy[i].currentScore])
    }
    population = quickSort(object: population)
    for i in 0 ... population.count/3 - 1 {
        //print(population[i][1])
        newPopulation.append(populationListCopy[population[i][0]])
        returnPopulation.append(population[i])
    }
    
    return returnPopulation
}

func mutate(DNA: [Int]) -> [Int] {
    var newDNA = [Int]()
    for item in DNA {
        newDNA.append(item)
    }
    let mutateCount: Int = Int.random(in: 1 ... 10)
    var mutateLocation: Int = 0
    for i in 1 ... mutateCount {
        mutateLocation = Int.random(in: 0 ... 106)
        newDNA[mutateLocation] = Int.random(in: 0 ... 20)
    }
    return newDNA
}
