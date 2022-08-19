//
//  GameAI.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 19/08/2022.
//

import Foundation

class GameAI {
    func difficultySelector(userMove:[TicTacToeMove?],isDifficult: Bool,callback isPosOccupied:(Int)->(Bool))-> Int {
        let res: Int
        if isDifficult {
            res = challengingAI(in: userMove, callback: isPosOccupied)
        } else {
            res = easyAI(in: userMove, callBack: isPosOccupied)
        }
        return res
    }
    
    func challengingAI(in userMoves: [TicTacToeMove?],callback isPosOccupied:(Int)->(Bool)) -> Int {
        if let res =  decisionUltil(in: userMoves, playerType: .bot, callback: isPosOccupied) {
            return res
        }
        //Block if ai can't win
        if let res =  decisionUltil(in: userMoves, playerType: .human, callback: isPosOccupied) {
            return res
        }
        
        //Check if the middle square is occupied
        let middleSquarePos = 4
        if !isPosOccupied(middleSquarePos) {
            return middleSquarePos
        }
        //Random Move for AI
        return randomMove(callBack: isPosOccupied)
    }
    
    func easyAI(in userMoves: [TicTacToeMove?], callBack isPosOccupied : (Int)->(Bool)) -> Int {
        let inputAIMoves = userMoves.compactMap{$0}.filter{$0.playerType == .bot}
        //Remove the board index
        return randomMove(callBack: isPosOccupied)
    }
    
    func decisionUltil(in userMoves: [TicTacToeMove?], playerType: PlayerType, callback isPosOccupied:(Int)->(Bool)) -> Int? {
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
                let isNotClear = !isPosOccupied(winPos.first!)
                if isNotClear {return winPos.first! }
            }
        }
        return nil
    }
    
    func randomMove(callBack isPosOccupied: (Int)->(Bool)) -> Int {
        var aiMovePosGenerator = Int.random(in: 0..<9)
        
        while isPosOccupied(aiMovePosGenerator){
            aiMovePosGenerator = Int.random(in: 0..<9)
        }
        return aiMovePosGenerator
    }
}
