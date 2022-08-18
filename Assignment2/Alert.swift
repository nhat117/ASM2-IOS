//
//  Alert.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 11/08/2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title :Text
    var msg: Text
    var buttonTitle : Text
}

struct PopUpAlert {
    static let humanWin = AlertItem(title: Text("You win !!!"),
                                    msg: Text("You are supper smart"),
                                    buttonTitle: Text("Hell Yeah"))
    static let botWin = AlertItem(title: Text("You lose !!!"),
                                  msg: Text("You are supper stupid"),
                                  buttonTitle: Text("Revenge"))
    static let draw = AlertItem(title: Text("Draw !!!"),
                                msg: Text("Meh"),
                                buttonTitle: Text("ReMatch"))
}
