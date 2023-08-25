//
//  Userviewmodel.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 29/08/2023.
//

import Foundation

class Userviewmodel: ObservableObject {
    
    @Published private var model = UserModel()

    //get users from User model
    func getUsers() -> [String] {
        model.getUsers()
    }

    //Get a user point from the User model
    func getScore(name: String) -> Int {
        model.getScore(name: name)
    }

    //Add more user in User Model and initialize first score = 0
    func addUser(_ info: String) {
        print(info)
        model.addUser(info)
        model.addScore(0)
    }

    //Add point to the User model
    func addPoint(_ score: Int) {
        model.addScore(score)
        print(score)
    }

    //Get all points from user model
    func getScores() -> [Int] {
        model.getScores()
    }

    //upfate point while user is playing
    func updateScore(score: Int) {
        model.updateLastScore(score: score)
    }
}
