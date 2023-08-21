//
//  TicGameModelPerformanceTests.swift
//  TicTacToeTests
//
//  Created by Eric Callanan on 11/03/2022.
//

import XCTest

class TicGameModelPerformanceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testFirstMove() {
        let gameTests = TicGameModelTests()

        self.measure {
            gameTests.testStartBoard_oToMove_SelectCell4()

        }
    }

    func testFirstMove2() {
        let gameTests = TicGameModelTests()
        let metrics: [XCTMetric] = [
            XCTClockMetric()
        ]
        let options = XCTMeasureOptions.default
        options.iterationCount = 5
        
        measure(metrics: metrics, options: options) {
            gameTests.testStartBoard_oToMove_SelectCell4()
        }
    }
}
