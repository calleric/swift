//
//  TicModelTests.swift
//  TicTacToeTests
//
//  Created by Eric Callanan on 07/10/2021.
//

import XCTest
@testable import TicTacToe

class TicGameModelTests: XCTestCase {
        
    func test_initialValue_nineCells() {
        // Arrange
        let ticModel = TicGameModel()
        
        // Act
        
        // Assert
        XCTAssertEqual(ticModel.grid.count, 9)
    }
    
    func test_initialValue_nineBlankCells() {
        // Arrange
        let ticModel = TicGameModel()
        
        // Act

        // Assert
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_setCell3_isX() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        ticModel.setCell(n: 3, c: .x)

        // Assert
        XCTAssertTrue(ticModel.grid[3] == Cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.x }.count), 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 8)
    }

    func test_setCellTwice_ignoreSecond() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        ticModel.setCell(n: 3, c: .x)
        ticModel.setCell(n: 3, c: .o)

        // Assert
        XCTAssertTrue(ticModel.grid[3] == Cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.x }.count), 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 8)
    }

    func test_setCellBlank_ignored() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        ticModel.setCell(n: 3, c: .x)
        ticModel.setCell(n: 3, c: .b)

        // Assert
        XCTAssertTrue(ticModel.grid[3] == Cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.x }.count), 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 8)
    }

    func test_setCell42_isIgnored() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        ticModel.setCell(n: 42, c: .x)

        // Assert
        XCTAssertTrue(ticModel.grid.contains { $0 == Cell.b } )
    }

    func test_initialGame_isNotWon() {
        // Arrange
        let ticModel = TicGameModel()

        // Act

        // Assert
        XCTAssertEqual(Winner.none, ticModel.winner)
    }

    func test_topLineX_xIsWinner() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .b, .o, .o,
                                .b, .b, .b]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(Winner.x, ticModel.winner)
    }

    func test_middleLineX_xIsWinner() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.o, .o, .b,
                                .x, .x, .x,
                                .b, .b, .b]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(Winner.x, ticModel.winner)
    }

    func test_bottomLineX_xIsWinner() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.o, .o, .b,
                                .b, .b, .b,
                                .x, .x, .x]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(Winner.x, ticModel.winner)
    }

    func test_leftLineO_oIsWinner() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.o, .b, .b,
                                .o, .b, .x,
                                .o, .b, .x]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(Winner.o, ticModel.winner)
    }

    func test_middleLineO_oIsWinner() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.b, .o, .b,
                                .b, .o, .x,
                                .b, .o, .x]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(Winner.o, ticModel.winner)
    }

    func test_rightLineO_oIsWinner() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .b, .o,
                                .x, .b, .o,
                                .b, .b, .o]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(Winner.o, ticModel.winner)
    }

    func test_diagonalO_oIsWinner() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.o, .b, .x,
                                .b, .o, .x,
                                .b, .b, .o]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(Winner.o, ticModel.winner)
    }

    func test_diagonalX_xIsWinner() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.b, .b, .x,
                                .b, .x, .o,
                                .x, .b, .o]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(Winner.x, ticModel.winner)
    }

    func test_isGridFullNewGame_false() {
        // Arrange
        let ticModel = TicGameModel()

        // Act

        // Assert
        XCTAssertFalse(ticModel.isGridFull)
    }

    func test_isGridFullPartialGame_false() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in 0..<5 {
            ticModel.setCell(n: i, c: .x)
        }

        // Assert
        XCTAssertFalse(ticModel.isGridFull)
    }

    func test_isGridFullGameOver_true() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in 0..<9 {
            ticModel.setCell(n: i, c: .o)
        }

        // Assert
        XCTAssertTrue(ticModel.isGridFull)
    }
    
    func test_startGame_xPlayerTurn() {
        // Arrange
        let ticModel = TicGameModel()

        // Act

        // Assert
        XCTAssertTrue(ticModel.isXTurn)
    }
    
    func test_secondTurn_isO() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        ticModel.setCell(n: 5, c: .x)

        // Assert
        XCTAssertFalse(ticModel.isXTurn)
    }
    
    func test_repeatTurn_ignored() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        ticModel.setCell(n: 5, c: .x)
        ticModel.setCell(n: 5, c: .o)
        ticModel.setCell(n: 5, c: .b)

        // Assert
        XCTAssertFalse(ticModel.isXTurn)
    }

    func test_winLinesNewGame_empty() {
        // Arrange
        let ticModel = TicGameModel()

        // Act

        // Assert
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 8)
    }

    func test_winLinesTopRow_oneTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in [0,1,2] {
            ticModel.setCell(n: i, c: .x)
        }

        // Assert
        XCTAssertTrue(ticModel.winningLines[0])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesMiddleRow_oneTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in [3,4,5] {
            ticModel.setCell(n: i, c: .o)
        }

        // Assert
        XCTAssertTrue(ticModel.winningLines[1])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }
    
    func test_winLinesBottomRow_oneTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in [6,7,8] {
            ticModel.setCell(n: i, c: .o)
        }

        // Assert
        XCTAssertTrue(ticModel.winningLines[2])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }
    
    func test_winLinesLeftCol_oneTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in [0,3,6] {
            ticModel.setCell(n: i, c: .x)
        }

        // Assert
        XCTAssertTrue(ticModel.winningLines[3])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesMiddleCol_oneTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in [1,4,7] {
            ticModel.setCell(n: i, c: .x)
        }

        // Assert
        XCTAssertTrue(ticModel.winningLines[4])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesRightCol_oneTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in [2,5,8] {
            ticModel.setCell(n: i, c: .x)
        }

        // Assert
        XCTAssertTrue(ticModel.winningLines[5])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesDiag1_oneTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in [0,4,8] {
            ticModel.setCell(n: i, c: .o)
        }

        // Assert
        XCTAssertTrue(ticModel.winningLines[6])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesDiag2_oneTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        for i in [2,4,6] {
            ticModel.setCell(n: i, c: .o)
        }

        // Assert
        XCTAssertTrue(ticModel.winningLines[7])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesFullDraw_noneTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .o,
                                .o, .x, .o]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 8)
    }

    func test_winLinesFullGridX_allTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .x, .x, .x,
                                .x, .x, .x]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual((ticModel.winningLines.filter { $0 == true }.count), 8)
    }

    func test_winLinesTwo_twoTrue() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .o, .x, .o,
                                .o, .x, .o]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual((ticModel.winningLines.filter { $0 == true }.count), 2)
    }
    
    func test_xToWinInOneMove_cell6() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .o,
                                .x, .o, .o,
                                .b, .b, .b]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(ticModel.nextMove(player: .x), 6)
    }
    
    func test_oToWinInOneMove_cell6() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .o,
                                .x, .o, .o,
                                .b, .b, .b]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(ticModel.nextMove(player: .o), 6)
    }

    func test_xToDrawInOne_cell7() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .o,
                                .o, .o, .x,
                                .x, .b, .o]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(ticModel.nextMove(player: .x), 7)
    }

    func test_xToBlock_cell2() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .b, .b,
                                .b, .o, .b,
                                .o, .b, .x]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(ticModel.nextMove(player: .x), 2)
    }

    func test_xToDraw_cell1() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .b, .b,
                                .b, .o, .b,
                                .b, .b, .b]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(ticModel.nextMove(player: .x), 1)
    }

    func test_xAndoGame_draw() {
        // Arrange
        var ticModel = TicGameModel()

        // Act
        let fullGrid: [Cell] = [.x, .b, .b,
                                .b, .b, .b,
                                .b, .b, .b]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Assert
        XCTAssertEqual(ticModel.nextMove(player: .o), 4)
        ticModel.setCell(n: 4, c: .o)
        XCTAssertEqual(ticModel.nextMove(player: .x), 1)
        ticModel.setCell(n: 1, c: .x)
        XCTAssertEqual(ticModel.nextMove(player: .o), 2)
        ticModel.setCell(n: 2, c: .o)
        XCTAssertEqual(ticModel.nextMove(player: .x), 6)
        ticModel.setCell(n: 6, c: .x)
        XCTAssertEqual(ticModel.nextMove(player: .o), 3)
        ticModel.setCell(n: 3, c: .o)
        XCTAssertEqual(ticModel.nextMove(player: .x), 5)
        ticModel.setCell(n: 5, c: .x)
        XCTAssertEqual(ticModel.nextMove(player: .o), 7)
        ticModel.setCell(n: 7, c: .o)
        XCTAssertEqual(ticModel.nextMove(player: .x), 8)
    }
    
    func test_initialValue_twoPlayers() {
        // Arrange
        let ticModel = TicGameModel()

        // Act

        // Assert
        XCTAssertTrue(ticModel.isTwoPlayer)
    }

    func test_setOnePlayer_onePlayer() {
        // Arrange
        let ticModel = TicGameModel(twoPlayer: false)

        // Act

        // Assert
        XCTAssertFalse(ticModel.isTwoPlayer)
    }

    func test_setTwoPlayers_twoPlayers() {
        // Arrange
        let ticModel = TicGameModel(twoPlayer: true)

        // Act

        // Assert
        XCTAssertTrue(ticModel.isTwoPlayer)
    }

    func test_xAndoSystemTurns_draw() {
        // Arrange
        var ticModel = TicGameModel(twoPlayer: false)

        // Act
        let fullGrid: [Cell] = [.x, .b, .b,
                                .b, .b, .b,
                                .b, .b, .b]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()
        ticModel.takeSystemTurn()

        // Assert
        XCTAssertTrue(ticModel.isGridFull)
        XCTAssertEqual(Winner.none, ticModel.winner)
    }
    
    func test_initialBoardDisabled_false() {
        // Arrange
        let ticModel = TicGameModel()

        // Act

        // Assert
        XCTAssertFalse(ticModel.isBoardDisabled)
    }
    
    func test_OnePlayer_boardDisabled() {
        // Arrange
        var ticModel = TicGameModel(twoPlayer: false)

        // Act
        ticModel.setCell(n: 0, c: .x)

        // Assert
        XCTAssertTrue(ticModel.isBoardDisabled)
    }
    
    func test_OnePlayerPlay_boardNotDisabled() {
        // Arrange
        var ticModel = TicGameModel(twoPlayer: false)

        // Act
        ticModel.setCell(n: 0, c: .x)
        ticModel.takeSystemTurn()

        // Assert
        XCTAssertFalse(ticModel.isBoardDisabled)
    }
    
    func test_TwoPlayer_boardNotDisabled() {
        // Arrange
        var ticModel = TicGameModel(twoPlayer: true)

        // Act
        ticModel.setCell(n: 0, c: .x)

        // Assert
        XCTAssertFalse(ticModel.isBoardDisabled)
    }
    
    func test_oToWinInOneMove_ThreeBlankCells() {
        // Arrange
        var ticModel = TicGameModel()
        let fullGrid: [Cell] = [.x, .o, .x,
                                .b, .o, .b,
                                .x, .b, .b]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Act
        let nextCell = ticModel.nextMove(player: .o)
        ticModel.setCell(n: nextCell, c: .o)

        // Assert
        XCTAssertEqual(nextCell, 7)
        XCTAssertEqual(ticModel.winner, .o)
    }

    func test_oToDraw_TwoBlankCells() {
        // Arrange
        var ticModel = TicGameModel()
        let fullGrid: [Cell] = [.x, .o, .x,
                                .o, .o, .x,
                                .b, .x, .b]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }

        // Act
        let nextCell = ticModel.nextMove(player: .o)

        // Assert
        XCTAssertEqual(nextCell, 8)
    }

    
    func testStartBoard_oToMove_SelectCell4() {
        // Arrange
        var ticModel = TicGameModel()
        ticModel.setCell(n: 0, c: .x)

        // Act
        let nextCell = ticModel.nextMove(player: .o)

        // Assert
        XCTAssertEqual(nextCell, 4)
    }
    //
    //Minimizing: Cell = 1, Score = 3
    //Minimizing: Cell = 2, Score = 3
    //Minimizing: Cell = 3, Score = 3
    //Minimizing: Cell = 4, Score = 0
    //Minimizing: Cell = 5, Score = 3
    //Minimizing: Cell = 6, Score = 3
    //Minimizing: Cell = 7, Score = 3
    //Minimizing: Cell = 8, Score = 3
    //

}




