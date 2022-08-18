//
//  GameView.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 18/08/2022.
//

import SwiftUI

struct GameView: View {
    let cols = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    
    @State private var userMove : [TicTacToeMove?] = Array(repeating: nil, count: 9)
    @State private var isUserMove: Bool = true
    @State private var alertUser: AlertItem?
    var body: some View {
        GeometryReader { screenSize in
            VStack {
                //TODO: Reserve for logo
                Text("TicTacToe").font(.title).fontWeight(Font.Weight.bold).padding()
                ScoreView()
                Spacer()
                LazyVGrid(columns: cols, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            Rectangle().foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.57)).opacity(0.65).frame(width: screenSize.size.width/4, height: screenSize.size.width/4).cornerRadius(20).padding(screenSize.size.width/70)
                            
                            //Display the move of player
                            let name = userMove[i]?.chessImage ?? ""
                            //Can add Animation here
                            Image(systemName: name).resizable()
                                .scaledToFit()
                                .frame(width: screenSize.size.width/6, height: screenSize.size.width/6)
                                .opacity(name != "" ? 1 : 0)
                                .animation(.easeOut(duration: Double.random(in: 0.5...0.7)))
                        }.onTapGesture {
                            //Perform game logic here
                            if isPosOccupied(in: userMove, inputMoveLocation: i) {return}
                            userMove[i] = TicTacToeMove(playerName: "", playerType: .human , moveLocation: i)
                            //Check for condition
                            print(isWin(for: .human, in: userMove))
                            if isWin(for: .human, in: userMove) {
                                print("Human Win")
                                alertUser = PopUpAlert.humanWin
                                return
                            }
                            print(isWin(for: .human, in: userMove))
                            if isDraw(in: userMove) {
                                alertUser = PopUpAlert.draw
                                print("Draw")
                                return
                            }
                            
                            isUserMove = false
                            //TODO: Check for winning or draw condition
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                //Change difficulty
                                let aiPosition = difficultySelector(in: userMove, isDifficult: false)
                                userMove[aiPosition] =  TicTacToeMove(playerName: "Bot", playerType: .bot, moveLocation: aiPosition)
                                //Disable double tap
                                isUserMove = true
                                
                                if isWin(for: .bot, in: userMove) {
                                    print("Bot Win")
                                    alertUser = PopUpAlert.botWin
                                    return
                                }
                                
                                if isDraw(in: userMove) {
                                    print("Draw")
                                    alertUser = PopUpAlert.draw
                                    return
                                }
                            }
                            
                        }
                    }
                }.padding([.trailing,.leading],20)
                Spacer()
                Spacer()
            }.disabled(!isUserMove)
                .alert(item: $alertUser) { alertUser in
                    Alert(title: alertUser.title, message: alertUser.msg, dismissButton: .default(alertUser.buttonTitle, action: {
                        resetGame()
                    }))
                }
        }
    }
    
    //MARK: Game logic, please refractor this shit !!!
    func isPosOccupied (in userMoves: [TicTacToeMove?], inputMoveLocation: Int) -> Bool {
        userMoves.contains(where: {$0?.moveLocation == inputMoveLocation})
    }
    
    //MARK: GameAI
    
    func difficultySelector(in userMoves: [TicTacToeMove?], isDifficult: Bool)-> Int {
        let res: Int
        if isDifficult {
            res = challengingAI(in: userMoves)
        } else {
            res = easyAI(in: userMoves)
        }
        return res
    }
    
    func challengingAI(in userMoves: [TicTacToeMove?]) -> Int {
        if let res =  decisionUltil(in: userMoves, playerType: .bot) {
            return res
        }
        //Block if ai can't win
        if let res =  decisionUltil(in: userMoves, playerType: .human) {
            return res
        }
        
        //Check if the middle square is occupied
        let middleSquarePos = 4
        if !isPosOccupied(in: userMoves, inputMoveLocation: middleSquarePos) {
            return middleSquarePos
        }
        //Random Move for AI
        return randomMove(in: userMoves)
    }
    
    func easyAI(in userMoves: [TicTacToeMove?]) -> Int {
        let inputAIMoves = userMoves.compactMap{$0}.filter{$0.playerType == .bot}
        //Remove the board index
       return randomMove(in: userMoves)
    }
    
    func decisionUltil(in userMoves: [TicTacToeMove?], playerType: PlayerType) -> Int? {
        let winComb: Set<Set<Int>> = [[0, 1, 2],
                                       [3, 4, 5],
                                       [6, 7, 8],
                                       [0, 3, 6],
                                       [1, 4, 7],
                                       [2, 5, 8],
                                       [0, 4, 8],
                                       [2, 4, 6]]
        
        let inputUserMoves = userMoves.compactMap{$0}.filter{$0.playerType == playerType}
        //Remove the board index
        let inputUserPos = Set(inputUserMoves.map{$0.moveLocation})
        
        for pattern in winComb{
            let winPos = pattern.subtracting(inputUserPos)
            
            if winPos.count == 1 {
                let isNotClear = !isPosOccupied(in: userMoves, inputMoveLocation: winPos.first!)
                if isNotClear {return winPos.first! }
            }
        }
        return nil
    }
    
    func randomMove(in userMoves: [TicTacToeMove?]) -> Int {
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
            if(winningCombination.allSatisfy(inputUserPos.contains)) {
                return true
            }
        }
        return false
    }
    
    func isDraw(in userMoves: [TicTacToeMove?]) ->Bool {
        return userMoves.compactMap{$0}.count == 9
    }
    
    func resetGame() {
        userMove = Array(repeating: nil, count: 9)
    }
    
    //MARK: Enhancing AI
    
    //MARK: POPUP Alert
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
