//
//  LeaderBoardView.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 18/08/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    var body: some View {
        GeometryReader {screen in
            VStack {
                Spacer()
                Text("Leader Board").font(Font.system(size: 38)).fontWeight(.bold)
                Image("TrophyImg").resizable().scaledToFit().frame(width: screen.size.width/4, height: screen.size.height/8)
                Spacer()
                ScrollView() {
                    VStack (spacing: screen.size.height/21){
                        LeaderBoardCell().padding(.top)
                        LeaderBoardCell()
                        LeaderBoardCell()
                        LeaderBoardCell()

                    }
                }
            }
            
        }
    }
}


struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
