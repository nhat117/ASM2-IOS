//
//  Move.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 11/08/2022.
//

import Foundation

enum PlayerType {
    case human, bot
}

struct TicTacToeMove {
    let playerName: String
    let playerType: PlayerType
    let moveLocation: Int
    
    var chessImage : String {
        return playerType == .human ? "xmark" : "circle"
    }
}
