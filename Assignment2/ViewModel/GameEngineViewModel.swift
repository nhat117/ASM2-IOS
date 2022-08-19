//
//  GameEngineViewModel.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 19/08/2022.
//

import SwiftUI

class GameEngine: ObservableObject {
    let cols = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    @Published var userMove : [TicTacToeMove?] = Array(repeating: nil, count: 9)
    @Published var isUserMove: Bool = true
    @Published var alertUser: AlertItem?
    let gameAI = GameAI()
    //MARK: Game logic
    
    func processUserMove(for pos: Int) {
        //Perform game logic here
        if isPosOccupied(inputMoveLocation: pos) {return}
        userMove[pos] = TicTacToeMove(playerName: "", playerType: .human , moveLocation: pos)
        //Check for condition
        if isWin(for: .human) {
            alertUser = PopUpAlert.humanWin
            return
        }
        if isDraw() {
            alertUser = PopUpAlert.draw
            print("Draw")
            return
        }
        
        isUserMove = false
        //TODO: Check for winning or draw condition
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            //Change difficulty
            let aiPosition = gameAI.difficultySelector(userMove: self.userMove, isDifficult: true, callback: self.isPosOccupied)
            userMove[aiPosition] =  TicTacToeMove(playerName: "Bot", playerType: .bot, moveLocation: aiPosition)
            //Disable double tap
            isUserMove = true
            
            if isWin(for: .bot) {
                alertUser = PopUpAlert.botWin
                return
            }
            
            if isDraw() {
                print("Draw")
                alertUser = PopUpAlert.draw
                return
            }
        }
    }
    
    func isPosOccupied (inputMoveLocation: Int) -> Bool {
        self.userMove.contains(where: {$0?.moveLocation == inputMoveLocation})
    }
    
    func isWin(for playerType: PlayerType) -> Bool {
        let winningCombinations = [[0, 1, 2],
                                   [3, 4, 5],
                                   [6, 7, 8],
                                   [0, 3, 6],
                                   [1, 4, 7],
                                   [2, 5, 8],
                                   [0, 4, 8],
                                   [2, 4, 6]]
        //Isolated moves
        let inputUserMoves = self.userMove.compactMap{$0}.filter{$0.playerType == playerType}
        //Remove the board index
        let inputUserPos: [Int] = [Int](inputUserMoves.map{$0.moveLocation})
        
        for winningCombination in winningCombinations {
            if(winningCombination.allSatisfy(inputUserPos.contains)) {
                return true
            }
        }
        return false
    }
    
    func isDraw() ->Bool {
        return self.userMove.compactMap{$0}.count == 9
    }
    
    func resetGame() {
        userMove = Array(repeating: nil, count: 9)
    }
}
