//
//  ScoreView.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 18/08/2022.
//

import SwiftUI

struct ScoreView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Your Score").font(.title)
                Text("12").font(.title)
            }
            Spacer()
            VStack {
                Text("Bot Score").font(.title)
                Text("12").font(.title)
            }
        }.padding()
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
