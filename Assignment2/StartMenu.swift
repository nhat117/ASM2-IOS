//
//  StartMenu.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 16/08/2022.
//

import SwiftUI

struct StartMenu: View {
    var body: some View {
        VStack {
            //TODO: Make startmenu View
            Image("InAppLogo").resizable().scaledToFit().frame(width: 200, height:200).padding()
            Text("Hi Nhat").font(Font.system(size: 50, weight: .medium)).padding()
            Spacer()
        
            Button(action: { print("hello") }, label: {
                ZStack {
                    Color(red: 0.56, green: 0.56, blue: 0.57)
                    Image(systemName: "play.fill").font(.system(size: 58)).foregroundColor(.white)
                }.frame(width: 140, height: 100).cornerRadius(20)
            }).padding()
            
            Button(action: { print("hello") }, label: {
                ZStack {
                    Color(red: 0.56, green: 0.56, blue: 0.57)
                    Image(systemName: "goforward").font(.system(size: 58)).foregroundColor(.white)
                }.frame(width: 140, height: 100).cornerRadius(20)
            }).padding()
            
            Button(action: { print("hello") }, label: {
                ZStack {
                    Color(red: 0.56, green: 0.56, blue: 0.57)
                    Image("TrophyImg").resizable().scaledToFit().frame(width: 70, height: 100)
                }.frame(width: 140, height: 100).cornerRadius(20)
            })
            
        }.padding()

    }
}

struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
