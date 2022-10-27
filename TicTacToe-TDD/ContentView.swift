//
//  ContentView.swift
//  TicTacToe-TDD
//
//  Created by Aks_dev on 27/10/22.
//

import SwiftUI

struct ContentView: View {
    
    let boxes = [Box(),Box(),Box(),Box(),Box(),Box(),Box(),Box(),Box()]
    
    let gameColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                    LazyVGrid(columns: gameColumns) {
                        ForEach(0..<9) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 5,style: .circular)
                                    .foregroundColor(.cyan)
                                .frame(width: proxy.size.width * 0.30,height: proxy.size.width * 0.30,alignment: .bottom)
                        }
                    }
                }
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
