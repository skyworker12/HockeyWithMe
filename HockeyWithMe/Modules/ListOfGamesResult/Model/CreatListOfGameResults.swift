//
//  File.swift
//  HockeyWithMe
//
//  Created by Никита Кудряков on 28/02/2019.
//  Copyright © 2019 Никита Кудряков. All rights reserved.
//

import Foundation
class CreatListOfGameResults: CreatListOfGame{
    var downloadListOfGameResults = DowloadListOfGamesResult()

    func creatListOfGame(userDates: UserDates?,userDate: String?,completion:@escaping ([ShortResults]?,Error?)->()){
        downloadListOfGameResults.downloadGamesResult(dates: userDates, date: userDate, completion: {[weak self](data, error) in
            if let data = data{
                completion(self?.formationFinalArray(data), error)
            }else{
                completion(nil, error)
            }
        })
    }
}

extension CreatListOfGameResults{
    private func formationFinalArray(_ data: GameResults) -> [ShortResults]{
        var finalArray = [ShortResults]()
        
        for i in data.dates {
            let container = DateAndGamesStruct(date: i.date, games: i.games)
            
            for item in container.games{
                
                let containerTwo = ShortResults(gamePk: item.gamePk, gameDate: item.gameDate, gameStatus: item.status.abstractGameState, homeTeamName: item.teams.home.team.name, homeTeamScore: item.teams.home.score, homeTeamRecord: (item.teams.home.leagueRecord.wins, item.teams.home.leagueRecord.losses, item.teams.home.leagueRecord.ot), awayTeamName: item.teams.away.team.name, awayTeamScore: item.teams.away.score, awayTeamRecord: (item.teams.away.leagueRecord.wins, item.teams.away.leagueRecord.losses, item.teams.away.leagueRecord.ot), gamePlace: item.venue.name)
                
                finalArray.append(containerTwo)
            }
        }
        
        return finalArray
    }
}
