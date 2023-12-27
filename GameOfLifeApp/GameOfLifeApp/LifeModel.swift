//
//  LifeModel.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//


import SwiftUI

struct LifeModel {
    private(set) var cellCount:Int
    var grid:[[Int]]
    private(set) var numberOfCycles: Int
    
    init(cells:Int){
        cellCount = cells
        grid = Array(repeating: Array(repeating: 0, count: cellCount), count: cellCount)
        self.numberOfCycles = 0
        self.randomise()
    }
    
    mutating func randomise() {
        for r in 0..<cellCount {
            for c in 0..<cellCount {
                grid[r][c] = (Int.random(in: 1..<100))%3 == 0 ? 1 : 0
            }
        }
    }
    
    mutating func step() {
        let newGrid = nextGrid(currentGrid: self.grid)
        if self.grid != newGrid {
            self.grid = newGrid
            numberOfCycles += 1
        }
    }
    
    mutating func performStepDelay() async -> Bool {
        var gridIsDifferent = true
        let newGrid = nextGrid(currentGrid: self.grid)
        if self.grid == newGrid {
            gridIsDifferent = false
        } else {
            self.grid = newGrid
            numberOfCycles += 1
        }

        usleep(300000)
        return gridIsDifferent
    }
        
    func nextGrid(currentGrid:[[Int]]) -> [[Int]] {
        // initialise the next grid with all zeros
        var nextGrid = Array(repeating: Array(repeating: 0, count: cellCount), count: cellCount)

        for row in 0..<(currentGrid.count) {
            for col in 0..<(currentGrid[row].count) {
                // Create a 3x3 grid for cells surrounding the current cell
                let surroundingGrid: [[Int]] = [
                    [
                        currentGrid[(row-1+currentGrid.count)%currentGrid.count][(col-1+currentGrid[row].count)%currentGrid[row].count],
                        currentGrid[(row-1+currentGrid.count)%currentGrid.count][col],
                        currentGrid[(row-1+currentGrid.count)%currentGrid.count][(col+1+currentGrid[row].count)%currentGrid[row].count]
                    ],
                    [
                        currentGrid[row][(col-1+currentGrid[row].count)%currentGrid[row].count],
                        currentGrid[row][col],
                        currentGrid[row][(col+1+currentGrid[row].count)%currentGrid[row].count]
                    ],
                    [
                        currentGrid[(row+1+currentGrid.count)%currentGrid.count][(col-1+currentGrid[row].count)%currentGrid[row].count],
                        currentGrid[(row+1+currentGrid.count)%currentGrid.count][col],
                        currentGrid[(row+1+currentGrid.count)%currentGrid.count][(col+1+currentGrid[row].count)%currentGrid[row].count]
                    ]
                ]
                let cellValue:Int = determineCellValue(threeGrid: surroundingGrid)

                nextGrid[row][col] = cellValue
            }
        }
        
        return nextGrid
    }
    
    ///  Rules
    ///  1.   Any live cell with fewer than two live neighbours dies, as if by underpopulation.
    ///  2.   Any live cell with two or three live neighbours lives on to the next generation.
    ///  3 .  Any live cell with more than three live neighbours dies, as if by overpopulation.
    ///  4.   Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    func determineCellValue(threeGrid:[[Int]]) -> Int {
        let currentCellValue = threeGrid[1][1]
        let neighbourCount = threeGrid.flatMap { $0 }.reduce(0, +) - currentCellValue
        var cellValue = 0
        switch neighbourCount {
        case 0..<2 :
            cellValue = 0
        case 2:
            cellValue = currentCellValue==1 ? 1 : 0
        case 3:
            cellValue = 1
        case 4..<9 :
            cellValue = 0
        default:
            cellValue = 0
        }
        return cellValue
    }
    
}
