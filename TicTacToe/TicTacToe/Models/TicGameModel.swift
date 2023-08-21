//
//  TicModel.swift
//  TicTacToe
//
//  Created by Eric Callanan on 06/10/2021.
//

import Foundation

enum Winner {
    case o, x, none
}

struct TicGameModel {
    private var _board: TicBoardModel
    private var _winner: Winner
    private var _playerXTurn: Bool
    private var _winningLines: [Bool]
    private var _boardDisabled: Bool
    private var _twoPlayer: Bool

    init(twoPlayer: Bool = true) {
        _board = TicBoardModel(cells: [.b, .b, .b,
                                       .b, .b, .b,
                                       .b, .b, .b])
        _winningLines = []
        for _ in 0..<8 {
            _winningLines.append(false)
        }
        _winner = .none
        _playerXTurn = true
        _boardDisabled = false
        _twoPlayer = twoPlayer
    }

    var grid: [Cell] {
        get { _board.grid }
    }

    var winner: Winner {
        get { _winner }
    }

    var isGridFull: Bool {
        get { _board.availableCells.count == 0 }
    }

    var isXTurn: Bool {
        get { _playerXTurn }
    }
    
    var isTwoPlayer: Bool {
        get { _twoPlayer }
    }
    
    var isBoardDisabled: Bool {
        get { _boardDisabled }
    }
    
    var winningLines: [Bool] {
        get { _winningLines }
    }
    
    func nextMove(player: Cell) -> Int {
        // Select a random cell if the board is empty
        if _board.availableCells.count == 9 {
            return Int.random(in: 0..<9)
        }
        
        var bestMove = -1
        // Maximising
        if player == .x {
            var maxScore = Int.min
            for cell in _board.availableCells {
                let score = minimax(board: _board,
                                    cellNum: cell,
                                    isMaximising: true,
                                    bestMax: -20,
                                    bestMin: +20)
                print("Maximising: Cell = \(cell), Score = \(score)")
                if score > maxScore {
                    maxScore = score
                    bestMove = cell
                }
            }
        } else { // player == .o - Minimising
            var minScore = Int.max
            for cell in _board.availableCells {
                let score = minimax(board: _board,
                                    cellNum: cell,
                                    isMaximising: false,
                                    bestMax: -20,
                                    bestMin: +20)
                print("Minimizing: Cell = \(cell), Score = \(score)")
                if score < minScore {
                    minScore = score
                    bestMove = cell
                }
            }
        }
        return bestMove
    }
    
    mutating func setCell(n:Int, c: Cell) {
        guard _board.grid.indices.contains(n) else {
            return
        }
        guard _board.grid[n] == .b else {
            return
        }
        _board = TicBoardModel(cells: _board.grid, n: n, c: c)
        _winner = winningPlayer(board: _board)
        _winningLines = winningLines(board: _board)
        _playerXTurn.toggle()
        
        // Disable the board if it is a one player game
        if !_twoPlayer {
            _boardDisabled = true
        }
    }
    
    mutating func takeSystemTurn() {
        guard !_twoPlayer else {
            return
        }
        let cellIndex = nextMove(player: _playerXTurn ? .x : .o)
        setCell(n: cellIndex, c: _playerXTurn ? .x : .o)
        
        // Enable the board after the system has taken a turn
        _boardDisabled = false
    }
    
    private func winningLines(board b: TicBoardModel) -> [Bool] {
        var result = [false, false, false, false, false, false, false, false]
        let winOptions: [Set<Int>] = [
            [0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]]

        let oCells: Set<Int> = Set(b.grid.indices.map { b.grid[$0] == Cell.o ? $0 : -1 })
        let xCells: Set<Int> = Set(b.grid.indices.map { b.grid[$0] == Cell.x ? $0 : -1 })

        for (i, win) in winOptions.enumerated() {
            if win.intersection(xCells) == win {
                result[i] = true
            }
            if win.intersection(oCells) == win {
                result[i] = true
            }
        }
        return result
    }

    private func winningPlayer(board b: TicBoardModel) -> Winner {
        // There are 8 possible winning options in Tic Tac Toe
        // The order of these options needs to match _winningLines
        let winOptions: [Set<Int>] = [
            [0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]]

        let oCells: Set<Int> = Set(b.grid.indices.map { b.grid[$0] == Cell.o ? $0 : -1 })
        let xCells: Set<Int> = Set(b.grid.indices.map { b.grid[$0] == Cell.x ? $0 : -1 })

        for win in winOptions {
            if win.intersection(xCells) == win {
                return .x
            }
            if win.intersection(oCells) == win {
                return .o
            }
        }
        return .none
    }

    private func minimax(board: TicBoardModel,
                         cellNum: Int,
                         isMaximising: Bool,
                         bestMax: Int,
                         bestMin: Int) -> Int {
        let b = TicBoardModel(cells: board.grid,
                              n: cellNum,
                              c: isMaximising ? .x : .o)

        let scoreFactor = b.availableCells.count + 1
        
        // Base case
        if winningPlayer(board: b) == .x {
            return 1 * scoreFactor
        } else if winningPlayer(board: b) == .o {
            return -1 * scoreFactor
        } else if b.availableCells.count == 0 {
            return 0
        }

        // Maximising
        if isMaximising {
            var minVal = Int.max
            for nextMove in b.availableCells {
                let score = minimax(board: b,
                                    cellNum: nextMove,
                                    isMaximising: false,
                                    bestMax: bestMax,
                                    bestMin: bestMin)

                minVal = min(minVal, score)
                if min(bestMin, minVal) < bestMax {
                    print("isMaximising - in break")
                    break
                }
            }
            return minVal
        } else { // Minimising
            var maxVal = Int.min
            for nextMove in b.availableCells {
                let score = minimax(board: b,
                                    cellNum: nextMove,
                                    isMaximising: true,
                                    bestMax: bestMax,
                                    bestMin: bestMin)
                maxVal = max(maxVal, score)
                if max(bestMax, maxVal) > bestMin {
                    print("Minimising - in break")
                    break
                }
            }
            return maxVal
        }
    }

}
