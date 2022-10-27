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
    @Published var gameState: GameStates = .newGame
    @Published var winningPlayer = "?"
    @Published var currentPlayer = Players.player1
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
    
    func setGameBoardStateFor(state: GameStates){
        switch state {
        case .playing:
            winningPlayer = "?"
        case .won:
            winningPlayer = currentPlayer.rawValue
            gameState = .won
        case .draw:
            gameState = .draw
            winningPlayer = "None!"
        case .newGame:
            gameState = .playing
            winningPlayer = "?"
            boxes = Array(repeating: nil, count: 9)
        }
    }
}
