//
//  LifeViewModel.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

@Observable class LifeViewModel {
    var lifeModel = LifeModel(cells: 10)
    private(set) var isRunning: Bool

    init() {
        self.isRunning = false
    }

    var numberOfCycles:  Int  {
        return lifeModel.numberOfCycles
    }
    
    func reset(gridSize: Int = 10) {
        self.isRunning = false
        self.lifeModel = LifeModel(cells: gridSize)
    }
    
    func step() {
        lifeModel.step()
    }
    
    func setGridSize(cellNumber:Int) {
        self.lifeModel = LifeModel(cells: cellNumber)
    }
    
    @MainActor
    func performNumberOfCycles(number: Int) async {
        self.isRunning = true
        for _ in 1...number {
            let different = await lifeModel.performStepDelay()
            if !different || !self.isRunning {
                break
            }
        }
        self.isRunning = false
    }
    
    @MainActor
    func stop() async {
        self.isRunning = false
    }
}

