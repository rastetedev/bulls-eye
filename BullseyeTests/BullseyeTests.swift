//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Raul Astete on 10/08/21.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
       game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScoreIsPositive() throws {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreIsNegative() throws {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testNewRound() throws {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testExtraBonus100() throws {
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testExtraBonus50() throws {
        let guess = game.target + 1
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 149)
    }
    
    func testResetGame() throws {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        XCTAssertNotEqual(game.getLeaderboardEntries().count, 0)
        game.resetGame()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
        XCTAssertEqual(game.getLeaderboardEntries().count, 0)
    }
    
    func testOrderLeaderboardsRetrievedInDescendingOrderByDate() throws {
        let firstDate = Date()
        let secondDate = firstDate.addingTimeInterval(TimeInterval(30))
        let thirdDate = secondDate.addingTimeInterval(TimeInterval(30))
        game.saveLeaderboardEntry(leaderboardEntry: LeaderboardEntry(points: 100, date: firstDate))
        game.saveLeaderboardEntry(leaderboardEntry: LeaderboardEntry(points: 200, date: secondDate))
        game.saveLeaderboardEntry(leaderboardEntry: LeaderboardEntry(points: 300, date: thirdDate))
       
        let entries = game.getLeaderboardEntries()
        XCTAssertEqual(entries[0].points, 300)
        XCTAssertGreaterThan(entries[0].date, entries[1].date)
    }
    
    

   
}
