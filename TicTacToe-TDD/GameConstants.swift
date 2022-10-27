//
//  GameConstants.swift
//  TicTacToe-TDD
//
//  Created by Aks_dev on 27/10/22.
//

import Foundation

enum Players: String, CaseIterable {
    case player1 = "Player1"
    case player2 = "Player2"
}

enum GameStates {
    case won
    case draw
    case playing
    case newGame
}
