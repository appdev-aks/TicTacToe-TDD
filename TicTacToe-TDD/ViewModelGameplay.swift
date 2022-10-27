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

    let gameColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
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
