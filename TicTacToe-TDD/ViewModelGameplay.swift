//
//  ViewModelGameplay.swift
//  TicTacToe-TDD
//
//  Created by Aks_dev on 27/10/22.
//

import Foundation
import SwiftUI

class ViewModelGameplay: ObservableObject  {
    @Published var boxes: [Box?] = Array(repeating: nil, count: 9)
    @Published var gameState: GameStates = .playing
    @Published var winningPlayer = "?"
    @Published var currentPlayer = Players.player1
    @Published var resetButtonEnabled = true
    /* Gameboard
     0 1 2
     3 4 5
     6 7 8
     */
    let winningCombinations: Set<Set<Int>> = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [1, 4, 7], [2, 5, 8], [2, 4, 6], [3, 4, 5], [6, 7, 8]]
    
    let gameColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func checkForWinningCombination() -> Bool {
        let playerMoves = boxes.compactMap{$0}.filter{$0.player == currentPlayer}
        let playerPositions = Set(playerMoves.map{$0.boxIndex})

        for pattern in winningCombinations where pattern.isSubset(of: playerPositions){
            setGameBoardStateFor(state: .won)
            return true
        }
        return false
    }
    
    func isGameDraw() -> Bool{
        if boxes.contains(where: { $0 == nil }) {
            return false
        }else {
            setGameBoardStateFor(state: .draw)
            return true
        }
    }
    
    func isBoxIsAvailableForMove(position: Int) -> Bool{
        boxes[position] == nil ? true : false
    }
    
    func isNextMovePossible() -> Bool{
        if checkForWinningCombination() || isGameDraw() {
            return false
        }
        return true
    }
    
    func resetGame(){
        setGameBoardStateFor(state: .newGame)
    }
    
    func setGameBoardStateFor(state: GameStates){
        switch state {
        case .playing:
            winningPlayer = "?"
            resetButtonEnabled = true
        case .won:
            winningPlayer = currentPlayer.rawValue
            gameState = .won
            resetButtonEnabled = false
        case .draw:
            gameState = .draw
            winningPlayer = "None!"
            resetButtonEnabled = false
        case .newGame:
            gameState = .playing
            winningPlayer = "?"
            currentPlayer = Players.player1
            boxes = Array(repeating: nil, count: 9)
            resetButtonEnabled = true
        }
    }
}
