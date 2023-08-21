//
//  TicViewModel.swift
//  TicTacToe
//
//  Created by Eric Callanan on 06/10/2021.
//

import Foundation

class TicViewModel: ObservableObject {
    @Published private var ticModel: TicGameModel

    init() {
        ticModel = TicGameModel()
    }
    
    var grid: [Cell] {
        get { ticModel.grid }
    }

    var winnerDisplay: String {
        get {
            var message = ""
            if ticModel.winner == .x {
                message = "X Wins"
            }
            else if ticModel.winner == .o {
                message = "O Wins"
            }
            else if ticModel.winner == .none && isGameOver {
                message = "Draw"
            }
            return message
        }
    }

    var isGameOver: Bool {
        get { ticModel.isGridFull || (ticModel.winner != .none) }
    }
    
    var isXTurn: Bool {
        get { ticModel.isXTurn }
    }
    
    var winningLines: [Bool] {
        get { ticModel.winningLines }
    }

    var isTwoPlayer: Bool {
        get { ticModel.isTwoPlayer }
    }
    
    var isBoardDisabled: Bool {
        get { ticModel.isBoardDisabled }
    }
    
    func setCell(index: Int, cellValue: Cell)  {
        ticModel.setCell(n: index, c: cellValue)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            ticModel.takeSystemTurn()
        }
    }

    func reset(twoPlayer: Bool) {
        // initialize a new model
        ticModel = TicGameModel(twoPlayer: twoPlayer)
    }
}




