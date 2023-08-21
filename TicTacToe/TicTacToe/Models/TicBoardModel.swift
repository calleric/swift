//
//  TicBoardModel.swift
//  TicTacToe
//
//  Created by Eric Callanan on 30/10/2021.
//

import Foundation

enum Cell: String {
    case x = "X"
    case o = "O"
    case b = "" // blank
}

struct TicBoardModel {
    var grid: [Cell]
    
    init(cells: [Cell]) {
        grid = cells
    }
    
    init(cells: [Cell], n: Int, c: Cell) {
        grid = cells
        grid[n] = c
    }
    
    var availableCells: [Int] {
        get { grid.indices.filter { grid[$0] == .b } }
    }
}
