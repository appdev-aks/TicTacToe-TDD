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
    
    func test_whenGameStateIsPlayable_WinnerShouldBeUndecided(){
        viewModel.setGameBoardStateFor(state: .playing)
        XCTAssertEqual(viewModel.winningPlayer, "?")
        XCTAssertNotEqual(viewModel.winningPlayer, "None!")
        XCTAssertNotEqual(viewModel.winningPlayer, Players.player1.rawValue)
        XCTAssertNotEqual(viewModel.winningPlayer, Players.player2.rawValue)
    }
    
    func test_whenGameStateIsWon_WinnerShouldBePlayerOneOrPlayerTwo(){
        viewModel.setGameBoardStateFor(state: .won)
        XCTAssertTrue(Players.allCases.contains { $0.rawValue == viewModel.winningPlayer })
        XCTAssertNotEqual(viewModel.winningPlayer, "?")
        XCTAssertNotEqual(viewModel.winningPlayer, "None!")
    }
    
    func test_whenGameStateIsDraw_WinnerShouldBeNone(){
        viewModel.setGameBoardStateFor(state: .draw)
        XCTAssertEqual(viewModel.winningPlayer, "None!")
        XCTAssertNotEqual(viewModel.winningPlayer, "?")
        XCTAssertNotEqual(viewModel.winningPlayer, Players.player1.rawValue)
        XCTAssertNotEqual(viewModel.winningPlayer, Players.player2.rawValue)
    }
}
