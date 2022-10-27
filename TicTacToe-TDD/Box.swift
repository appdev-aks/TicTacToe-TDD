//
//  Box.swift
//  TicTacToe-TDD
//
//  Created by Aks_dev on 27/10/22.
//

import Foundation

struct Box {
    var player: Players
    var boxIndex: Int
    var playerSymbol: String {
        switch player {
            case .player1:
                return "X"
            case .player2:
                return "O"
        }
    }
}
