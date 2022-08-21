//
//  StartMenu.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 16/08/2022.
//

import SwiftUI

struct StartMenu: View {
    var body: some View {
        GeometryReader { screen in
            VStack {
                //TODO: Make startmenu View
                Image("InAppLogo").resizable().scaledToFit().frame(height: screen.size.width / 3.4).padding()
                //TODO: Wire data here
                Spacer()
                Text("Hi Nhat").font(Font.system(size: 45, weight: .medium)).padding()
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        //TODO: Configuring button action here
                        Button(action: { print("hello") }, label: {
                            ZStack {
                                Color(red: 0.56, green: 0.56, blue: 0.57)
                                Image(systemName: "play.fill").font(.system(size: 58)).foregroundColor(.white)
                            }.frame(width: screen.size.width/3, height: 100).cornerRadius(20)
                        }).padding()
                        //TODO: Configuring button action here
                        Button(action: { print("hello") }, label: {
                            ZStack {
                                Color(red: 0.56, green: 0.56, blue: 0.57)
                                Image(systemName: "goforward").font(.system(size: 58)).foregroundColor(.white)
                            }.frame(width: screen.size.width/3,height: 100).cornerRadius(20)
                        }).padding()
                        //TODO: Configuring button action here
                        Button(action: { print("hello") }, label: {
                            ZStack {
                                Color(red: 0.56, green: 0.56, blue: 0.57)
                                Image("TrophyImg").resizable().scaledToFit().frame(width: 70, height: 80)
                            }.frame(width: screen.size.width/3,height: 100).cornerRadius(20)
                        })
                    }.padding()
                    Spacer()
                }
            }.padding()
        }
    }
}

struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
