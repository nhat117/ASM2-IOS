//
//  LoginView.swift
//  Assignment2
//
//  Created by Nhat Bui Minh on 21/08/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var pass: String = ""
    //TODO: Finishing Firebase
    var body: some View {
        GeometryReader { screen in
            VStack(spacing: 20){
                Image("InAppLogo").resizable().scaledToFit().frame(height: screen.size.width / 3.4).padding()
                HStack {
                    Text("Hi,").font(.system(size: 40, weight: .bold, design: .rounded))
                    Spacer()
                    Spacer()
                }.padding()
                VStack (spacing: 20){
                    //Email View
                    TextField("Email", text: $email)
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                    Rectangle()
                        .frame(width:screen.size.width/1.10 , height: 1)
                    //Password
                    
                    SecureField("Passworld", text: $pass)
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
        
                    Rectangle()
                        .frame(width:screen.size.width/1.10 , height: 1)
                }.padding()
                Spacer()
                //MARK: Button Group
                VStack {
                    Button {
                        //Sign up
                    } label: {
                        Text("Sign Up")
                            .font(.system(size: 24))
                            .bold()
                            .frame(width: screen.size.width/2.6, height: screen.size.height/12)
                            
                            .background(Color(red: 0.56, green: 0.56, blue: 0.57))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                    }.padding()
                    
                    Button {
                        //Login
                    } label: {
                        Text("Already have an account? Login")
                            .font(.system(size: 18))
                            .bold()
                            .foregroundColor(.red)
                    }.padding(.top)
                }
                Spacer()
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
