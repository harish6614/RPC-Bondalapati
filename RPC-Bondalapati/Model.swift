//
//  Model.swift
//  RPC-Bondalapati
//
//  Created by Bondalapati,Harish on 2/20/18.
//  Copyright © 2018 Bondalapati,Harish. All rights reserved.
//

enum Choice { case None, Rock, Paper, Scissor, Spock, Lizard}

class Model {
    private var player1Choice:Choice
    private var player2Choice:Choice
    
    var player1:Choice { get { return player1Choice } }
    var player2:Choice { get { return player1Choice } }
    
    private init(){
        player1Choice = Choice.None
        player2Choice = Choice.None
    }
    
    func reset() {
        player1Choice = Choice.None
        player2Choice = Choice.None
    }
    
    func haveResult() -> Bool {
        return !(Choice.None == player1Choice || Choice.None == player2Choice)
    }
    
    func  winner() -> String {
        if(player1Choice == player2Choice) {
            return "Its a Tie"
        }
        
        for ch in Model.conquers(choice: player1Choice) {
            if(player2Choice == ch){
                return "Player 1 wins"
            }
        }
        
        return "Player 2 wins"
    }
    
    func choosePlayer1(pick:Choice) {
        player1Choice = pick
    }
    
    func choosePlayer2(pick:Choice) {
        player2Choice = pick
    }
    
    private static func conquers(choice:Choice) -> [Choice]  {
        switch choice {
        case .Rock:
            return [Choice.Lizard, Choice.Scissor]
        case .Paper:
            return [Choice.Rock, Choice.Spock]
        case .Scissor:
            return [Choice.Lizard, Choice.Paper]
        case .Lizard:
            return [Choice.Paper, Choice.Spock]
        case .Spock:
            return [Choice.Scissor, Choice.Rock]
        default:
            return []
        }
    }
}
