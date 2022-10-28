//
//  GameConstants.swift
//  TicTacToe-TDD
//
//  Created by Aks_dev on 27/10/22.
//

import Foundation

enum Players: String, CaseIterable {
    case player1 = "Rick"
    case player2 = "Morty"
}

enum GameStates {
    case won
    case draw
    case playing
    case newGame
}
