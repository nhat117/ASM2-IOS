//
//  ContentView.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 10/08/2022.
//

import SwiftUI

//Storing the grid of of the tictactoe game

struct ContentView: View {
    let cols = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    
    @State private var userMove : [TicTacToeMove?] = Array(repeating: nil, count: 9)
    @State private var isUserMove: Bool = true
    
    var body: some View {
        GeometryReader { screenSize in
            VStack {
                HStack {
                    //Need to display a score view
                }
                Spacer()
                LazyVGrid(columns: cols, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Rectangle().foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.57)).opacity(0.65).frame(width: screenSize.size.width/4, height: screenSize.size.width/4).cornerRadius(20).padding(5)
                            
                            //Display the move of player
                            let name = userMove[i]?.chessImage ?? ""
                            Image(systemName: name).resizable()
                                .scaledToFit()
                                .frame(width: screenSize.size.width/6, height: screenSize.size.width/6)
                        }.onTapGesture {
                            //Perform game logic here
                            if isPosOccupied(in: userMove, inputMoveLocation: i) {return}
                            userMove[i] = TicTacToeMove(playerName: "", playerType: .human , moveLocation: i)
                            isUserMove = false
                            if isWin(for: .human, in: userMove) {
                                print("Human Win")
                                return
                            }
                            
                            if isDraw(in: userMove) {
                                print("Draw")
                                return
                            }
                            //TODO: Check for winning or draw condition
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                let aiPosition = aiMovePos(in: userMove)
                                userMove[aiPosition] =  TicTacToeMove(playerName: "Bot", playerType: .bot, moveLocation: aiPosition)
                                //Disable double tap
                                isUserMove = true
                                if isWin(for: .bot, in: userMove) {
                                    print("Bot Win")
                                    return
                                }
                                
                                if isDraw(in: userMove) {
                                    print("Draw")
                                    return
                                }
                            }
                            
                        }
                    }
                }.padding([.trailing,.leading],20)
                Spacer()
            }.disabled(!isUserMove)
        }
    }
    
    //MARK: Game logic, please refractor this shit !!!
    func isPosOccupied (in userMoves: [TicTacToeMove?], inputMoveLocation: Int) -> Bool {
        userMoves.contains(where: {$0?.moveLocation == inputMoveLocation})
    }
    
    func aiMovePos(in userMoves: [TicTacToeMove?]) -> Int {
        var aiMovePosGenerator = Int.random(in: 0..<9)
        
        while isPosOccupied(in: userMoves, inputMoveLocation: aiMovePosGenerator){
            aiMovePosGenerator = Int.random(in: 0..<9)
        }
        return aiMovePosGenerator
    }
    
    func isWin(for playerType: PlayerType, in userMoves: [TicTacToeMove?]) -> Bool {
        let winningCombinations = [[0, 1, 2],
                                   [3, 4, 5],
                                   [6, 7, 8],
                                   [0, 3, 6],
                                   [1, 4, 7],
                                   [2, 5, 8],
                                   [0, 4, 8],
                                   [2, 4, 6]]
        //Isolated moves
        let inputUserMoves = userMoves.compactMap{$0}.filter{$0.playerType == playerType}
        //Remove the board index
        let inputUserPos: [Int] = [Int](inputUserMoves.map{$0.moveLocation})
        
        for winningCombination in winningCombinations {
            if(winningCombination == inputUserPos) {
                return true
            }
        }
        return false
    }
    
    func isDraw(in userMoves: [TicTacToeMove?]) ->Bool {
        return userMoves.compactMap{$0}.count == 9
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
