//
//  TicTacToe_TDDTests.swift
//  TicTacToe-TDDTests
//
//  Created by Aks_dev on 27/10/22.
//

import XCTest
@testable import TicTacToe_TDD

final class TDDExampleTests: XCTestCase {

    func test_StartGame_NineBoxesAvailable(){
        let view = ContentView()
        XCTAssertEqual(view.boxes.count, 9)
    }
    
    func test_GameShouldHaveTwoPlayers() {
        let playerCount = Players.allCases.count
        XCTAssertEqual(playerCount, 2)
    }
    
    func test_GameShouldHaveNineBoxes(){
        let view = ContentView()
        XCTAssertEqual(view.boxes.count, 9)
    }
}
