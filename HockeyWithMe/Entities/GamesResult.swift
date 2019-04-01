//
//  GameResultStruct.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 11/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
struct GameResults: Codable {
    let copyright: String
    let totalItems, totalEvents, totalGames, totalMatches: Int
    let wait: Int
    let dates: [DateElement]
}

struct DateElement: Codable {
    let date: String
    let totalItems, totalEvents, totalGames, totalMatches: Int
    let games: [Game]
}

struct Game: Codable {
    let gamePk: Int
    let link, gameType, season: String
    var gameDate: String
    let status: Status
    let teams: Teams
    let venue: Venue
    let content: Content
}

struct Content: Codable {
    let link: String
}

struct Status: Codable {
    let abstractGameState, codedGameState, detailedState, statusCode: String
    let startTimeTBD: Bool
}

struct Teams: Codable {
    let away, home: Away
}

struct Away: Codable {
    let leagueRecord: LeagueRecord
    let score: Int
    let team: Venue
}

struct LeagueRecord: Codable {
    let wins, losses, ot: Int
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case league = "league"
}

struct Venue: Codable {
    let id: Int?
    let name, link: String
}

struct DateAndGamesStruct{
     let date: String
     let games: [Game]
}
struct ShortResults{
     let gamePk: Int
     var gameDate: String
     let gameStatus: String
     let homeTeamName: String
     let homeTeamScore: Int
     let awayTeamName: String
     let awayTeamScore: Int
}

struct UserDates{
    let startDate: String
    let endDate: String
}
