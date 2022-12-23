//
//  Picks.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import Foundation

func pickNumber(playerNumber: Int, number: Int, dices: [Int]) -> Int {
    if playerList[playerNumber].numberAvailable[number - 1] != true {
        print("Error calling something again")
    }
    playerList[playerNumber].numberAvailable[number - 1] = false
    var score: Int = 0
    for i in 0 ... dices.count - 1 {
        if dices[i] == number {
            score += number
        }
    }
    playerList[playerNumber].numberScore[number - 1] += score
    return score
}

func yacht(playerNumber: Int, dices: [Int]) -> Int {
    if playerList[playerNumber].yachtAvailable != true {
        print("Error calling something again")
    }
    playerList[playerNumber].yachtAvailable = false
    var oneNumber: Int = dices[0]
    for i in 1 ... dices.count - 1 {
        if dices[i] != oneNumber {
            playerList[playerNumber].yachtScore += 0
            return 0
        }
    }
    playerList[playerNumber].yachtScore += 50
    return 50
}

func smallStraight(playerNumber: Int, number: Int, dices: [Int]) -> Int {
    if playerList[playerNumber].smallStraightAvailable != true {
        print("Error calling something again")
    }
    playerList[playerNumber].smallStraightAvailable = false
    var exist: [Bool] = [false,false,false,false]
    for i in 0 ... dices.count - 1 {
        if dices[i] - number >= 0 && dices[i] - number < exist.count {
            if exist[dices[i] - number] == false {
                exist[dices[i] - number] = true
            }
        }
    }
    for i in 0 ...  exist.count - 1{
        if !exist[i] {
            playerList[playerNumber].smallStraightScore += 0
            return 0
        }
    }
    playerList[playerNumber].smallStraightScore += 15
    return 15
}

func largeStraight(playerNumber: Int, number: Int, dices: [Int]) -> Int {
    if playerList[playerNumber].largeStraightAvailable != true {
        print("Error calling something again")
    }
    playerList[playerNumber].largeStraightAvailable = false
    var exist: [Bool] = [false,false,false,false,false]
    for i in 0 ... dices.count - 1 {
        if dices[i] - number >= 0 && dices[i] - number < exist.count {
            if exist[dices[i] - number] == false {
                exist[dices[i] - number] = true
            } else {
                playerList[playerNumber].largeStraightScore += 0
                return 0
            }
        } else {
            playerList[playerNumber].largeStraightScore += 0
            return 0
        }
    }
    playerList[playerNumber].largeStraightScore += 30
    return 30
}

func choice(playerNumber: Int, dices: [Int]) -> Int {
    if playerList[playerNumber].choiceAvailable != true {
        print("Error calling something again")
    }
    playerList[playerNumber].choiceAvailable = false
    var score: Int = 0
    for i in 0 ... dices.count - 1 {
        score += dices[i]
    }
    playerList[playerNumber].choiceScore += score
    return score
}
