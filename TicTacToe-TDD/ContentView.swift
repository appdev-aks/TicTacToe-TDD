//
//  ContentView.swift
//  TicTacToe-TDD
//
//  Created by Aks_dev on 27/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModelGameplay()
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                Text("Player move: \(viewModel.currentPlayer.rawValue)")
                    .font(.largeTitle)
                Spacer()
                LazyVGrid(columns: viewModel.gameColumns, spacing: 15) {
                        ForEach(0..<9) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 5,style: .circular)
                                    .foregroundColor(.cyan)
                                .frame(width: proxy.size.width * 0.28,height: proxy.size.width * 0.28,alignment: .bottom)
                                Text(viewModel.boxes[index]?.playerSymbol ?? "")
                                    .font(.system(size: 60))
                                    .foregroundColor(.white)
                        }.onTapGesture {
                            if viewModel.isBoxIsAvailableForMove(position: index) && viewModel.gameState == .playing {
                                    viewModel.boxes[index] = Box(player: viewModel.currentPlayer, boxIndex: index)
                                    if viewModel.isNextMovePossible() {
                                        viewModel.currentPlayer =  (viewModel.currentPlayer == .player1) ? .player2 : .player1
                                }
                            }
                        }
                    }
                }
                
                Spacer()
                Text("Winner is: \(viewModel.winningPlayer)")
                    .font(.system(size: 25))
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
