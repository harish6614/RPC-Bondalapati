//
//  Model.swift
//  RPC-Bondalapati
//
//  Created by Bondalapati,Harish on 2/20/18.
//  Copyright © 2018 Bondalapati,Harish. All rights reserved.
//

enum Choice { case None, Rock, Paper, Scissor, Spock, Lizard}

class RSPModel {
    
    private var _player1Choice:Choice
    private var _player2Choice:Choice
    private var _player1WinsCount:Int
    private var _player2WinsCount:Int
    private var _player1Name:String
    private var _player2Name:String
    
    static var instance:RSPModel = RSPModel()
    
    var player1Choice:Choice { get { return _player1Choice } }
    var player2Choice:Choice { get { return _player2Choice } }
    var player1WinsCount:Int { get { return _player1WinsCount } }
    var player2WinsCount:Int { get { return _player2WinsCount } }
    var player1Name:String {
        get { return _player1Name }
        set { _player1Name = newValue }
    }
    var player2Name:String {
        get { return _player2Name }
        set { _player2Name = newValue }
    }
    
    private init() {
        _player1Choice = Choice.None
        _player2Choice = Choice.None
        _player1WinsCount = 0
        _player2WinsCount = 0
        _player1Name = "Player One"
        _player2Name = "Player Two"
    }
    
    func reset() {
        _player1Choice = Choice.None
        _player2Choice = Choice.None
        _player1WinsCount = 0
        _player2WinsCount = 0
        _player1Name = "Player One"
        _player1Name = "Player Two"
    }
    
    func haveResult() -> Bool {
        return !(Choice.None == _player1Choice || Choice.None == _player2Choice)
    }
    
    func  winner() -> String {
        if _player1Choice == player2Choice {
            return "Its a Tie"
        }
        
        for ch in RSPModel.conquers(choice: player1Choice) {
            if _player2Choice == ch {
                _player1WinsCount += 1
                return "Player 1 wins"
            }
        }
        
        _player2WinsCount += 1
        return "Player 2 wins"
    }
    
    func choosePlayer1(pick:Choice) {
        _player1Choice = pick
    }
    
    func choosePlayer2(pick:Choice) {
        _player2Choice = pick
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
