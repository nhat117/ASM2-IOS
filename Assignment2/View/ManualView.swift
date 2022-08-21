//
//  ManualView.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 20/08/2022.
//

import SwiftUI

struct ManualView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //Reserve for status bar
                Text("Tic tac toe Rules").font(.system(size: 30)).fontWeight(.bold).padding()
                //MARK: Rule for Tic Tac Toe
                Text("1. The game is played on a grid that's 3 squares by 3 squares.").padding()
                Text("2. You are X, your friend (or the computer in this case) is O. Players take turns putting their marks in empty squares.").padding()
                Text("3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.").padding()
                Text("4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie.").padding()
                //                YoutubeVideoView(youtubeVideoID: "5n2aQ3UQu9Y").padding()
                VStack(alignment: .leading) {
                    //Reserve for status bar
                    Text("Tic tac toe Rules").font(.system(size: 30)).fontWeight(.bold).padding()
                    //MARK: Rule for Tic Tac Toe
                    Text("1. The game is played on a grid that's 3 squares by 3 squares.").padding()
                    Text("2. You are X, your friend (or the computer in this case) is O. Players take turns putting their marks in empty squares.").padding()
                    Text("3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.").padding()
                    Text("4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie.").padding()
                }
                
            }
        }
    }
}
struct ManualView_Previews: PreviewProvider {
    static var previews: some View {
        ManualView()
    }
}
