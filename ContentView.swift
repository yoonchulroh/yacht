//
//  ContentView.swift
//  Yacht
//
//  Created by 노윤철 on 2021/11/13.
//

import SwiftUI

var playerList = [player]()
var DNAList = [[Int]]()
var survivedDNAScore = [[Int]]()
var gameEnded = false

struct ContentView: View {

    @State var result: [[Int]] = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
    @State var totalScore: Int = 0
    @State var average: Float = 0
    
    var body: some View {
        VStack {
            Button {
                for i in 0 ... 17 {
                    DNAList.append(createDNA())
                }
            } label: {
                Text("Launch")
            }
            Button {
                totalScore = 0
                for j in 0 ... 999 {
                    playerList = []
                    for i in 0 ... 17 {
                        playerList.append(DNAtoPlayer(playerNumber: i, DNA: DNAList[i]))
                    }
                    survivedDNAScore = evaluate(populationList: playerList)
                    
                    for i in 0 ... 5 {
                        totalScore += survivedDNAScore[i][1]
                        DNAList.append(mutate(DNA: DNAList[survivedDNAScore[i][0]]))
                        DNAList.append(mutate(DNA: DNAList[survivedDNAScore[i][0]]))
                    }
                }
                result = survivedDNAScore
                average = Float(totalScore) / 6000
            } label: {
                Text("Conduct")
            }
            Text(String(result[0][0]) + " - " + String(result[0][1]))
            Text(String(result[1][0]) + " - " + String(result[1][1]))
            Text(String(result[2][0]) + " - " + String(result[2][1]))
            Text(String(result[3][0]) + " - " + String(result[3][1]))
            Text(String(result[4][0]) + " - " + String(result[4][1]))
            Text(String(result[5][0]) + " - " + String(result[5][1]))
            Text(String(average))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
