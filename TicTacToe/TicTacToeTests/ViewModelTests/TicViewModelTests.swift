//
//  TicViewModelTests.swift
//  TicTacToeTests
//
//  Created by Eric Callanan on 09/10/2021.
//

import XCTest
@testable import TicTacToe

class TicViewModelTests: XCTestCase {

    func test_initialValue_nineCells() {
        // Arrange
        let ticViewModel = TicViewModel()
        // Act
        
        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
    }

    func test_initialValue_isBlank() {
        // Arrange
        let ticViewModel = TicViewModel()
        
        // Act
        
        // Assert
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_startGame_xPlayerTurn() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act

        // Assert
        XCTAssertTrue(ticViewModel.isXTurn)
    }

    func test_alternateTurns_xTurn() {
        // Arrange
        let ticViewModel = TicViewModel()

        for i in 1...9 {
            // Act
            ticViewModel.setCell(index: i-1, cellValue: .o)

            // Assert
            XCTAssertEqual(i%2==0  , ticViewModel.isXTurn)
        }
    }
    
    func test_startGame_winnerDisplayEmpty() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act

        // Assert
        XCTAssertFalse(ticViewModel.isGameOver)
        XCTAssertEqual("", ticViewModel.winnerDisplay)
    }
    
    func test_xWins_winnerDisplayXWins() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .o, .o, .b,
                                .b, .b, .b]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }
        
        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual("X Wins", ticViewModel.winnerDisplay)
    }

    func test_xWinsFull_winnerDisplayXWins() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .o, .x, .o,
                                .x, .o, .x]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }
        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual("X Wins", ticViewModel.winnerDisplay)
    }

    func test_oWins_winnerDisplayOWins() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .b,
                                .o, .o, .o]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }
        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual("O Wins", ticViewModel.winnerDisplay)
    }

    func test_draw_winnerDisplayDraw() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .o,
                                .o, .x, .o]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }

        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual("Draw", ticViewModel.winnerDisplay)
    }

    func test_reset_gridEmpty() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        ticViewModel.reset(twoPlayer: true)

        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_resetAfterOne_gridEmpty() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        ticViewModel.setCell(index: 0, cellValue: .x)
        ticViewModel.reset(twoPlayer: true)

        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_resetGameOver_gridEmpty() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .o,
                                .o, .x, .o]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }
        ticViewModel.reset(twoPlayer: true)

        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_winLinesNewGame_noneTrue() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act

        // Assert
        XCTAssertEqual((ticViewModel.winningLines.filter { $0 == false }.count), 8)
    }

    func test_winLinesDraw_noneTrue() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .o,
                                .o, .x, .o]
        for (i,c) in fullGrid.enumerated() {
            ticViewModel.setCell(index: i, cellValue: c)
        }

        // Assert
        XCTAssertEqual((ticViewModel.winningLines.filter { $0 == false }.count), 8)
    }

    func test_winLinesTopRow_oneTrue() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .b, .o, .o,
                                .b, .b, .b]
        for (i,c) in fullGrid.enumerated() {
            ticViewModel.setCell(index: i, cellValue: c)
        }

        // Assert
        XCTAssertTrue(ticViewModel.winningLines[0])
        XCTAssertEqual((ticViewModel.winningLines.filter { $0 }.count), 1)
    }

    func test_winLinesTwoRow_twoTrue() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .o, .x, .o,
                                .o, .x, .o]
        for (i,c) in fullGrid.enumerated() {
            ticViewModel.setCell(index: i, cellValue: c)
        }

        // Assert
        XCTAssertTrue(ticViewModel.winningLines[0])
        XCTAssertTrue(ticViewModel.winningLines[4])
        XCTAssertEqual((ticViewModel.winningLines.filter { $0 }.count), 2)
    }

    func test_winLinesAllRows_eightTrue() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .x, .x, .x,
                                .x, .x, .x]
        for (i,c) in fullGrid.enumerated() {
            ticViewModel.setCell(index: i, cellValue: c)
        }

        // Assert
        XCTAssertEqual((ticViewModel.winningLines.filter { $0  }.count), 8)
    }

    func test_reset_twoPlayers() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        ticViewModel.reset(twoPlayer: true)

        // Assert
        XCTAssertTrue(ticViewModel.isTwoPlayer)
    }
    
    func test_reset_onePlayer() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        ticViewModel.reset(twoPlayer: false)

        // Assert
        XCTAssertFalse(ticViewModel.isTwoPlayer)
    }
    
    func test_initialValue_boardNotDisabled() {
        // Arrange
        let ticViewModel = TicViewModel()
        
        // Act
        
        // Assert
        XCTAssertFalse(ticViewModel.isBoardDisabled)
    }

    func test_onpPlayerGame_boardDisabled() {
        // Arrange
        let ticViewModel = TicViewModel()
        
        // Act
        ticViewModel.reset(twoPlayer: false)
        ticViewModel.setCell(index: 0, cellValue: .x)
        
        // Assert
        XCTAssertTrue(ticViewModel.isBoardDisabled)
    }

}
