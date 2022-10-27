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
    
    func test_Player1ShouldPlayWith_SymbolX_Player2WithSymbolO(){
        viewModel.currentPlayer = .player1
        var box = Box(player: .player1, boxIndex: 0)
        XCTAssertEqual(box.playerSymbol, "X")
        box = Box(player: .player2, boxIndex: 1)
        XCTAssertEqual(box.playerSymbol, "O")
    }
    
    func test_NineWinningCombinations(){
        for winningCombination in viewModel.winningCombinations {
            let positionArray = Array(winningCombination)
            viewModel.boxes[0] = (Box(player: .player1, boxIndex: positionArray[0]))
            viewModel.boxes[1] = (Box(player: .player1, boxIndex: positionArray[1]))
            viewModel.boxes[2] = (Box(player: .player1, boxIndex: positionArray[2]))
            XCTAssertTrue(viewModel.checkForWinningCombination())
        }
    }
    
    func test_WhenAllBoxesPlayed_WithNoWinningCombination_GameShouldDraw(){
        viewModel.boxes[0] = (Box(player: .player1, boxIndex: 0))
        viewModel.boxes[1] = (Box(player: .player2, boxIndex: 1))
        viewModel.boxes[2] = (Box(player: .player1, boxIndex: 7))
        viewModel.boxes[3] = (Box(player: .player2, boxIndex: 3))
        viewModel.boxes[4] = (Box(player: .player1, boxIndex: 5))
        viewModel.boxes[5] = (Box(player: .player2, boxIndex: 8))
        viewModel.boxes[6] = (Box(player: .player1, boxIndex: 4))
        viewModel.boxes[7] = (Box(player: .player2, boxIndex: 2))
        viewModel.boxes[8] = (Box(player: .player1, boxIndex: 6))
        XCTAssertFalse(viewModel.checkForWinningCombination())
        XCTAssertTrue(viewModel.isGameDraw())
    }
}
