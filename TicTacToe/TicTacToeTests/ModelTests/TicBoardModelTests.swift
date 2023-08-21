//
//  TicBoardModelTests.swift
//  TicTacToeTests
//
//  Created by Eric Callanan on 30/10/2021.
//

import XCTest
@testable import TicTacToe

class TicBoardModelTests: XCTestCase {
    
    func test_initialValue_nineBlankCells() {
        // Arrange
        let ticBoardModel = TicBoardModel(cells: [.b, .b, .b,
                                                  .b, .b, .b,
                                                  .b, .b, .b])

        // Act

        // Assert
        XCTAssertEqual(ticBoardModel.grid.count, 9)
        XCTAssertEqual((ticBoardModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_availableCells_sixSevenEight() {
        // Arrange
        let ticBoardModel = TicBoardModel(cells: [.x, .o, .x,
                                                  .o, .x, .o,
                                                  .b, .b, .b])

        // Act

        // Assert
        XCTAssertEqual(ticBoardModel.availableCells, [6,7,8])
    }

    func test_availableCells_zeroFourSeven() {
        // Arrange
        let ticBoardModel = TicBoardModel(cells: [.b, .o, .x,
                                                  .o, .b, .o,
                                                  .x, .b, .x])

        // Act

        // Assert
        XCTAssertEqual(ticBoardModel.availableCells, [0,4,7])
    }
    
    func test_availableCellsAfterSetting_zeroFourSeven() {
        // Arrange
        let ticBoardModel = TicBoardModel(cells: [.b, .o, .x,
                                                  .o, .b, .o,
                                                  .x, .b, .x],
                                          n: 7,
                                          c: .x)

        // Act

        // Assert
        XCTAssertEqual(ticBoardModel.availableCells, [0,4])
    }
}
