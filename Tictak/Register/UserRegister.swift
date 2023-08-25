//
//  UserRegisterview.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 29/08/2023.
//

import SwiftUI

struct UserRegisterView: View {
    @Binding var name: String
    @State private var empty = false
    @ObservedObject var Usermodel: Userviewmodel
    @Binding var buttonCheck: Bool
    
    @Binding var show: Bool
    
    var body: some View {
        //Show when user access to game view
        if !show {
            ZStack {
                Color.black.opacity(!show ? 0.9 : 0).edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Casinogreen")
                    VStack{
                        Text("Register")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        HStack {
                            Text("User name: ")
                                .foregroundColor(.white)
                            TextField(
                                "Enter user name",
                                text: $name
                            )
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(15)
                        }
                        Spacer()
                        //Condition check about user register name
                        if(empty) {
                            Text("Please enter your name")
                                .foregroundColor(Color("Red"))
                        } else {}
                        Button {
                            //Check empty name
                             if (name == "") {
                                empty = true;
                            }
                            else {
                                buttonCheck = true
                                empty = false
                                show = true
                                Usermodel.addUser(name)
                            }
                        } label: {
                            Text("Play game")
                                .padding(5)
                        }
                        .modifier(Buttonfunction(color: Color("Bronzegold")))
                        .modifier(Shadow())
                    }
                    .padding()
                }
                .frame(width: 300, height: 300)
                .cornerRadius(30)
            }
        }
    }
}
