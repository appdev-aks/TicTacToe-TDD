//
//  TicTacToe_TDDTests.swift
//  TicTacToe-TDDTests
//
//  Created by Aks_dev on 27/10/22.
//

import XCTest
@testable import TicTacToe_TDD

final class TDDExampleTests: XCTestCase {

    var viewModel: ViewModelGameplay!

    override func setUpWithError() throws {
        viewModel = ViewModelGameplay()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func test_StartGame_NineBoxesAvailable(){
        XCTAssertEqual(viewModel.boxes.count, 9)
    }
    
    func test_GameShouldHaveTwoPlayers() {
        let playerCount = Players.allCases.count
        XCTAssertEqual(playerCount, 2)
    }
    
    func test_GameShouldHaveNineBoxes(){
        XCTAssertEqual(viewModel.boxes.count, 9)
    }
    
    func test_NewGame_AllNineBoxesShouldBeEmpty(){
        XCTAssertEqual(viewModel.gameState, .newGame)
        let emptyBoxes = viewModel.boxes.filter { $0 == nil  }
        XCTAssertEqual(emptyBoxes.count, 9)
    }
    
}
