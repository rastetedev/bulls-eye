//
//  Game.swift
//  Bullseye
//
//  Created by Raul Astete on 9/08/21.
//

import Foundation

struct Game {
    var target : Int = Int.random(in: 1...100)
    var score : Int = 0
    var round : Int = 1
    
    private var leaderboardEntries : [LeaderboardEntry] = []
    
    func points(sliderValue : Int) -> Int {
        let difference = abs(sliderValue - self.target)
        let bonus : Int
        
        if  difference == 0  { bonus = 100 }
        else if difference == 1 { bonus = 50 }
        else { bonus = 0 }
        
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points : Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        
        let leaderboardEntry = LeaderboardEntry(points: points, date: Date())
        saveLeaderboardEntry(leaderboardEntry: leaderboardEntry)
        
    }
    
    mutating func resetGame() {
        score = 0
        round = 1
        leaderboardEntries = []
        target = Int.random(in: 1...100)
    }
    
    mutating func saveLeaderboardEntry(leaderboardEntry: LeaderboardEntry) {
        leaderboardEntries.append(leaderboardEntry)
    }
    
    func getLeaderboardEntries() -> [LeaderboardEntry] {
        return leaderboardEntries.sorted { first, second in
            return first.date > second.date
        }
    }
    
}


struct LeaderboardEntry {
    
    let points: Int
    let date: Date
    
}
