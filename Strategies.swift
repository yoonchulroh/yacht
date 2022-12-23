//
//  Strategies.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import Foundation

func roll(playerNumber: Int, dices: [Int]) -> [Int] {
    var newDices: [Int] = dices
    for i in 0 ... dices.count - 1 {
        if dices[i] == 0 {
            newDices[i] = Int.random(in: 1...6)
        }
    }
    //print(newDices)
    playerList[playerNumber].rolledDices = newDices
    return newDices
}

func maximize(playerNumber: Int, number: Int, dices: [Int]) -> [Int] {
    if playerList[playerNumber].numberAvailable[number - 1] != true && playerList[playerNumber].yachtAvailable != true {
        print("Error calling something again")
    }
    var newDices: [Int] = dices
    for i in 0 ... dices.count - 1 {
        if dices[i] != number {
            newDices[i] = 0
        }
    }
    roll(playerNumber: playerNumber, dices: newDices)
    return newDices
}

func straightAttempt(playerNumber: Int, number: Int, dices: [Int]) -> [Int] {
    if !playerList[playerNumber].smallStraightAvailable && !playerList[playerNumber].largeStraightAvailable {
        print("Error calling something again")
    }
    var newDices: [Int] = dices
    var exist: [Bool] = [false,false,false,false,false]
    for i in 0 ... dices.count - 1 {
        if dices[i] - number >= 0 && dices[i] - number < exist.count {
            if exist[dices[i] - number] == false {
                exist[dices[i] - number] = true
            } else {
                newDices[i] = 0
            }
        } else {
            newDices[i] = 0
        }
    }
    roll(playerNumber: playerNumber, dices: newDices)
    return newDices
}

func choiceAttempt(playerNumber: Int, threshold: Int, dices: [Int]) -> [Int] {
    if playerList[playerNumber].choiceAvailable != true {
        print("Error calling something again")
    }
    var newDices: [Int] = dices
    for i in 0 ... dices.count - 1 {
        if dices[i] < threshold {
            newDices[i] = 0
        }
    }
    roll(playerNumber: playerNumber, dices: newDices)
    return newDices
}
