//
//  Conducts.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import Foundation

func conductStrategy(playerNumber: Int, strategy: Int, dices: [Int]) {
    switch(strategy) {
    case 11:
        //print("Strategy 1")
        maximize(playerNumber: playerNumber, number: 1, dices: dices)
    case 12:
        //print("Strategy 2")
        maximize(playerNumber: playerNumber, number: 2, dices: dices)
    case 13:
        //print("Strategy 3")
        maximize(playerNumber: playerNumber, number: 3, dices: dices)
    case 14:
        //print("Strategy 4")
        maximize(playerNumber: playerNumber, number: 4, dices: dices)
    case 15:
        //print("Strategy 5")
        maximize(playerNumber: playerNumber, number: 5, dices: dices)
    case 16:
        //print("Strategy 6")
        maximize(playerNumber: playerNumber, number: 6, dices: dices)
    case 21:
        //print("Strategy straight 1")
        straightAttempt(playerNumber: playerNumber, number: 1, dices: dices)
    case 22:
        //print("Strategy straight 2")
        straightAttempt(playerNumber: playerNumber, number: 2, dices: dices)
    case 32:
        //print("Strategy choice 2")
        choiceAttempt(playerNumber: playerNumber, threshold: 2, dices: dices)
    case 33:
        //print("Strategy choice 3")
        choiceAttempt(playerNumber: playerNumber, threshold: 3, dices: dices)
    case 34:
        //print("Strategy choice 4")
        choiceAttempt(playerNumber: playerNumber, threshold: 4, dices: dices)
    case 35:
        //print("Strategy choice 5")
        choiceAttempt(playerNumber: playerNumber, threshold: 5, dices: dices)
    case 36:
        //print("Strategy choice 6")
        choiceAttempt(playerNumber: playerNumber, threshold: 6, dices: dices)
    default:
        print("Error")
    }
}

func conductPick(playerNumber: Int, pick: Int, dices: [Int]) {
    switch(pick) {
    case 11:
        pickNumber(playerNumber: playerNumber, number: 1, dices: dices)
    //print("Player \(playerNumber) Picked 1, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 12:
        pickNumber(playerNumber: playerNumber, number: 2, dices: dices)
    //print("Player \(playerNumber) Picked 2, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 13:
        pickNumber(playerNumber: playerNumber, number: 3, dices: dices)
    //print("Player \(playerNumber) Picked 3, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 14:
        pickNumber(playerNumber: playerNumber, number: 4, dices: dices)
    //print("Player \(playerNumber) Picked 4, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 15:
        pickNumber(playerNumber: playerNumber, number: 5, dices: dices)
    //print("Player \(playerNumber) Picked 5, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 16:
        pickNumber(playerNumber: playerNumber, number: 6, dices: dices)
    //print("Player \(playerNumber) Picked 6, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 21:
        smallStraight(playerNumber: playerNumber, number: 1, dices: dices)
    //print("Player \(playerNumber) Picked small straight 1, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 22:
        smallStraight(playerNumber: playerNumber, number: 2, dices: dices)
    //print("Player \(playerNumber) Picked small straight 2, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 23:
        smallStraight(playerNumber: playerNumber, number: 3, dices: dices)
    //print("Player \(playerNumber) Picked small straight 3, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 24:
        largeStraight(playerNumber: playerNumber, number: 1, dices: dices)
    //print("Player \(playerNumber) Picked large straight 1, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 25:
        largeStraight(playerNumber: playerNumber, number: 2, dices: dices)
    //print("Player \(playerNumber) Picked large straight 2, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 30:
        choice(playerNumber: playerNumber, dices: dices)
    //print("Player \(playerNumber) Picked choice, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    case 40:
        yacht(playerNumber: playerNumber, dices: dices)
    //print("Player \(playerNumber) Picked yacht, current score: \(playerList[playerNumber].currentScore)")
    //print("")
    default:
        print("Error")
    }
}
