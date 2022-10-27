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
                LazyVGrid(columns: viewModel.gameColumns) {
                        ForEach(0..<9) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 5,style: .circular)
                                    .foregroundColor(.cyan)
                                .frame(width: proxy.size.width * 0.30,height: proxy.size.width * 0.30,alignment: .bottom)
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
