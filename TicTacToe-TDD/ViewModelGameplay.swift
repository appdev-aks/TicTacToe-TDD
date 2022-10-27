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

    let gameColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
}
