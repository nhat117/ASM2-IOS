//
//  ContentView.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 10/08/2022.
//

import SwiftUI

//Storing the grid of of the tictactoe game
let cols = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
struct ContentView: View {
    var body: some View {
        GeometryReader { screenSize in
            VStack {
                Spacer()
                LazyVGrid(columns: cols, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Rectangle().foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.57)).opacity(0.65).frame(width: screenSize.size.width/4, height: screenSize.size.width/4).cornerRadius(20).padding(5)
                            Image(systemName: "xmark").resizable().scaledToFit().frame(width: screenSize.size.width/5, height: screenSize.size.width/5)
                        }
                    }
                }.padding([.trailing,.leading],20)
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
