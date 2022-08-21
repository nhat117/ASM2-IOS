//
//  GameView.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 18/08/2022.
//

import SwiftUI

struct GameView: View {
    @ObservedObject private var gameEngine : GameEngine = GameEngine()
    
    var body: some View {
        GeometryReader { screenSize in
            VStack {
                //TODO: Reserve for logo
                HStack {
                    Image(systemName: "arrow.left").font(.system(size: 35)).padding()
                    Spacer()
                    Image("InAppLogo").resizable().scaledToFit().frame(height: screenSize.size.height/12)
                    Spacer()
                    Image(systemName: "book").font(.system(size: 35)).padding()
                }
                
                ScoreView()
                Spacer()
                //MARK: Main game View
                LazyVGrid(columns: gameEngine.cols, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Rectangle().foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.57)).opacity(0.65).frame(width: screenSize.size.width/4, height: screenSize.size.width/4).cornerRadius(20).padding(screenSize.size.width/70)
                            
                            //Display the move of player
                            let name = gameEngine.userMove[i]?.chessImage ?? ""
                            //Can add Animation here
                            Image(systemName: name).resizable()
                                .scaledToFit()
                                .frame(width: screenSize.size.width/6, height: screenSize.size.width/6)
                                .opacity(name != "" ? 1 : 0)
                                .animation(.easeOut(duration: Double.random(in: 0.5...0.7)))
                        }.onTapGesture {
                            gameEngine.processUserMove(for: i)
                        }
                    }
                }.padding([.trailing,.leading],20)
                Spacer()
                Spacer()
            }.disabled(!gameEngine.isUserMove)
                .alert(item: $gameEngine.alertUser) { alertUser in
                    Alert(title: alertUser.title, message: alertUser.msg, dismissButton: .default(alertUser.buttonTitle, action: {
                        gameEngine.resetGame()
                    }))
                }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
