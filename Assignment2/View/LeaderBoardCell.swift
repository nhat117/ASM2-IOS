//
//  LeaderBoardCell.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 18/08/2022.
//

import SwiftUI

struct LeaderBoardCell: View {
    var body: some View {
       
            ZStack {
                Color(red: 0.91, green: 0.91, blue: 0.91).cornerRadius(10)
                HStack {
                    Image(systemName: "applelogo").resizable().scaledToFit()
                    Spacer()
                    Text("Billie").font(.title).fontWeight(.medium)
                    Spacer()
                    Text("40").font(.title).fontWeight(.medium)
                }.padding()
            }.frame(maxHeight: 20).padding()
        }
}

struct LeaderBoardCell_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardCell()
    }
}
